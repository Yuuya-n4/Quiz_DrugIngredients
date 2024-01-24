class QuizSetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_quiz_set, only: [:show, :score]
  layout 'quiz', only: [:score]
  before_action :set_default_meta_tags, only: [:index, :show, :score]

  def index
    set_meta_tags title: 'トップページ'

    # Reactのアクション用に@quiz_setsを編集した
    @quiz_sets = QuizSet.all.map do |quiz_set|
      quiz_set_data = quiz_set.as_json
      if user_signed_in?
        quiz_set_data[:answered_quizzes_count] = quiz_set.answered_quizzes_count(current_user)
        quiz_set_data[:total_quizzes_count] = quiz_set.total_quizzes_count
      end
      quiz_set_data
    end
    @mastery_level = current_user.mastery_level if user_signed_in?
  end

  def show
    set_meta_tags title: 'クイズ開始'
    @total_questions = [@quiz_set.quizzes.count, 10].min
  end

  def start_quiz
    @quiz_set = QuizSet.find(params[:id])
    quiz_ids = @quiz_set.quizzes.pluck(:id).shuffle
    quiz_ids = quiz_ids.take(10) if quiz_ids.size > 10

    session[:quiz_ids] = quiz_ids
    session[:original_quiz_ids] = quiz_ids.dup
    session[:answered_quiz_ids] = []

    @score = current_user.scores.create(quiz_set: @quiz_set, correct_answer: 0)
    session[:score_id] = @score.id

    next_quiz_id = session[:quiz_ids].first
    redirect_to quiz_set_quiz_path(@quiz_set, next_quiz_id)
  end

  def score
    set_meta_tags title: 'スコア'
    @score = current_user.scores.find_by(id: session[:score_id])
    @total_quizzes = session[:original_quiz_ids].length
  end

  private

  def set_quiz_set
    @quiz_set = QuizSet.find_by(id: params[:id])
    redirect_to(quiz_sets_path, alert: '指定されたクイズセットが見つかりません。') unless @quiz_set
  end
end
