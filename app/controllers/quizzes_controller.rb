class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz_set, only: [:show, :answer, :explanation]
  before_action :set_quiz, only: [:show, :answer, :explanation]
  layout 'quiz', only: [:show, :explanation]
  before_action :set_default_meta_tags, only: [:show, :explanation, :index]

  def show
    set_meta_tags title: 'クイズ'
    @choices = @quiz.choices

    if session[:original_quiz_ids].present?
      @total_quizzes = session[:original_quiz_ids].length
      current_quiz_index = session[:original_quiz_ids].index(@quiz.id)
      @current_quiz_number = current_quiz_index + 1 if current_quiz_index
    end
  end

  def answer
    session.delete(:user_choice)
    choice = Choice.find(params[:choice_id])
    correct = @quiz.correct_choice?(choice)

    session[:user_choice] = { choice_id: choice.id, correct: correct }

    if session[:answered_quiz_ids]&.include?(@quiz.id)
      flash[:alert] = 'クイズにはそれぞれ1回のみ回答してください。'
      redirect_to score_quiz_set_path(@quiz_set) and return
    end

    score_record = current_user.scores.find(session[:score_id])
    score_record.correct_answer += 1 if correct
    score_record.save!

    session[:answered_quiz_ids] ||= []
    session[:answered_quiz_ids] << @quiz.id

    performance_summary = UserQuizPerformanceSummary.find_or_create_by(user: current_user, quiz: @quiz)
    performance_summary.increment!(:attempts)
    if correct
      performance_summary.increment!(:correct_answers)
      performance_summary.increment!(:consecutive_correct_answers)
    else
      performance_summary.update(consecutive_correct_answers: 0)
    end

    redirect_to explanation_quiz_set_quiz_path(@quiz_set, @quiz)
  end

  def explanation
    set_meta_tags title: 'クイズ解説'
    current_quiz_id = params[:id].to_i
    if session[:quiz_ids].nil?
      flash[:alert] = '前のページに戻らないでください'
      redirect_to score_quiz_set_path(@quiz_set)
      return
    end

    @user_choice = session[:user_choice]
    @chosen_choice = Choice.find_by(id: @user_choice['choice_id'])

    session[:quiz_ids].delete(current_quiz_id)

    @next_quiz_id = session[:quiz_ids].first
    @next_quiz = Quiz.find_by(id: @next_quiz_id)
    @current_quiz_number = session[:original_quiz_ids].index(current_quiz_id) + 1
    @total_quizzes = session[:original_quiz_ids].length

    if @next_quiz.nil?
      session.delete(:quiz_ids)
    end
  end

  def index
    set_meta_tags title: 'クイズ一覧'
  end

  def search
    query = params[:query]
    @quizzes = Quiz.joins(:quiz_set, :choices)
                   .where("quizzes.question LIKE :query OR quizzes.explanation LIKE :query OR quiz_sets.title LIKE :query OR (choices.text LIKE :query AND choices.correct = true)", query: "%#{query}%")
                   .distinct
                   .includes(:choices, :quiz_set)
  
    total_quizzes = @quizzes.count # 検索結果の総数を計算
    total_pages = (total_quizzes / 20.0).ceil # 1ページあたり20件でページ数を計算（例）
  
    render json: {
      quizzes: @quizzes.limit(20).as_json(include: { choices: { only: [:text, :correct] }, quiz_set: { only: :title } }),
      pagination: {
        total_pages: total_pages,
        current_page: 1 # 最初のページを表示
      }
    }
  end

  def api_index
    quizzes = Quiz.all.order(id: :asc).page(params[:page]).per(20)
    render json: {
      quizzes: quizzes.as_json(include: { choices: { only: [:text, :correct] }, quiz_set: { only: :title } }),
      pagination: {
        total_pages: quizzes.total_pages,
        current_page: quizzes.current_page
      }
    }
  end

  private

  def set_quiz_set
    @quiz_set = QuizSet.find_by(id: params[:quiz_set_id])
    unless @quiz_set
      redirect_to(score_quiz_set_path(@quiz_set), alert: '指定されたクイズセットが見つかりません。') and return
    end
  end

  def set_quiz
    @quiz = @quiz_set.quizzes.find_by(id: params[:id])
    unless @quiz
      redirect_to(score_quiz_set_path(@quiz_set), alert: '指定されたクイズが見つかりません。') and return
    end
  end
end
