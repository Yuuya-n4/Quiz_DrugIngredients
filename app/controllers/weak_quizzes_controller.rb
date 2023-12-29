class WeakQuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: [:show, :answer, :explanation]
  layout :choose_layout
  before_action :set_default_meta_tags, only: [:start, :show, :explanation, :score]

  def start
    set_meta_tags title: '苦手克服チャレンジ'
    @non_weak_quizzes_count = current_user.non_weak_quizzes_count
    @weak_quizzes_count = current_user.weak_quizzes_count
    @mastered_quizzes_count = current_user.mastered_quizzes_count
    @mastery_level = current_user.mastery_level

    @quiz_sets_stats = QuizSet.all.map do |quiz_set|
      [quiz_set, current_user.quiz_set_stats(quiz_set)]
    end.to_h

    @header_class = 'bg-green-500'
  end

  def start_quiz
    weak_quiz_ids = UserQuizPerformanceSummary.where(user: current_user)
                                              .select { |summary| summary.weak_subject? && summary.answered_twice_or_more? }
                                              .pluck(:quiz_id)
    weak_quiz_ids = weak_quiz_ids.sample(10)

    if weak_quiz_ids.size < 10
      extra_quiz_ids = Quiz.where.not(id: weak_quiz_ids).pluck(:id)
                           .sample(10 - weak_quiz_ids.size)
      weak_quiz_ids += extra_quiz_ids
    end
  
    shuffled_quiz_ids = weak_quiz_ids.shuffle
    session[:weak_quiz_ids] = shuffled_quiz_ids
    session[:original_weak_quiz_ids] = shuffled_quiz_ids.dup
    session[:weak_quiz_score] = 0
    session[:answered_quiz_ids] = []
  
    redirect_to action: :show, id: session[:weak_quiz_ids].first
  end

  def show
    set_meta_tags title: '苦手克服クイズ'
    @quiz = Quiz.find(params[:id])
    @choices = @quiz.choices

     current_quiz_id = params[:id].to_i
    current_quiz_index = session[:original_weak_quiz_ids].index(current_quiz_id)
    @current_quiz_number = current_quiz_index + 1 if current_quiz_index
    @total_quizzes = session[:original_weak_quiz_ids].size
  end


  def answer
    session.delete(:user_choice)
    choice = Choice.find(params[:choice_id])
    correct = @quiz.correct_choice?(choice)

    session[:user_choice] = { choice_id: choice.id, correct: correct }

    if session[:answered_quiz_ids]&.include?(@quiz.id)
      flash[:alert] = 'クイズにはそれぞれ1回のみ回答してください。'
      redirect_to score_weak_quizzes_path and return
    end

    if correct
      session[:weak_quiz_score] += 1
    end

    performance_summary = UserQuizPerformanceSummary.find_or_create_by(user: current_user, quiz: @quiz)
    performance_summary.increment!(:attempts)
    if correct
      performance_summary.increment!(:correct_answers)
      performance_summary.increment!(:consecutive_correct_answers)
    else
      performance_summary.update(consecutive_correct_answers: 0)
    end

    session[:answered_quiz_ids] ||= []
    session[:answered_quiz_ids] << @quiz.id
    redirect_to explanation_weak_quiz_path(@quiz)
  end

  def explanation
    set_meta_tags title: '苦手克服クイズ解説'
    current_quiz_id = params[:id].to_i

    @user_choice = session[:user_choice]
    @chosen_choice = Choice.find_by(id: @user_choice['choice_id'])

    current_quiz_index = session[:original_weak_quiz_ids].index(current_quiz_id)
    @current_quiz_number = current_quiz_index + 1 if current_quiz_index
    @total_quizzes = session[:original_weak_quiz_ids].size

    session[:weak_quiz_ids].delete(current_quiz_id)
  
    @next_quiz_id = session[:weak_quiz_ids].first
    @next_quiz = Quiz.find_by(id: @next_quiz_id)
  end

  def score
    set_meta_tags title: 'スコア'
    @score = session[:weak_quiz_score]
    @total_quizzes = session[:answered_quiz_ids].length
  end

  private

  def set_quiz
    @quiz = Quiz.find_by(id: params[:id])
    redirect_to(root_path, alert: '指定されたクイズが見つかりません。') unless @quiz
  end

  def choose_layout
    action_name == 'start' ? 'application' : 'weak_quizzes'
  end
end