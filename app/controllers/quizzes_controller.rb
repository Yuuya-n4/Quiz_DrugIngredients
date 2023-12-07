class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz_set, only: [:show, :answer, :explanation]
  before_action :set_quiz, only: [:show, :answer, :explanation]
  layout 'quiz', only: [:show, :explanation]

  def show
    @choices = @quiz.choices

    if session[:original_quiz_ids].present?
      @total_quizzes = session[:original_quiz_ids].length
      current_quiz_index = session[:original_quiz_ids].index(@quiz.id)
      @current_quiz_number = current_quiz_index + 1 if current_quiz_index
    end
  end

  def answer
    choice = Choice.find(params[:choice_id])
    correct = @quiz.correct_choice?(choice)

    if session[:answered_quiz_ids]&.include?(@quiz.id)
      flash[:alert] = 'クイズにはそれぞれ1回のみ回答してください。'
      redirect_to score_quiz_set_path(@quiz_set) and return
    end

    score_record = current_user.scores.find(session[:score_id])
    score_record.correct_answer += 1 if correct
    score_record.save!

    session[:answered_quiz_ids] ||= []
    session[:answered_quiz_ids] << @quiz.id

    redirect_to explanation_quiz_set_quiz_path(@quiz_set, @quiz)
  end

  def explanation
    current_quiz_id = params[:id].to_i
    session[:quiz_ids].delete(current_quiz_id)

    @next_quiz_id = session[:quiz_ids].first
    @next_quiz = Quiz.find_by(id: @next_quiz_id)

    if @next_quiz.nil?
      session.delete(:quiz_ids)
    end
  end

  def index
    @q = Quiz.ransack(params[:q])
    @quizzes = @q.result(distinct: true).order(:created_at).page(params[:page]).per(5)
  end

  def autocomplete
    @quizzes = Quiz.ransack(question_cont: search_query).result.limit(10)
    render json: @quizzes.map(&:question)
  end

  def search
    query = params[:query]

    quizzes_scope = Quiz.eager_load(:quiz_set, :choices)
                        .where('quizzes.question LIKE :query OR choices.text LIKE :query OR quizzes.explanation LIKE :query OR quiz_sets.title LIKE :query', query: "%#{query}%")
                        .references(:quiz_set, :choices)
  
    quizzes = quizzes_scope.select('quizzes.id, quizzes.question, quizzes.explanation, quiz_sets.title, quiz_sets.id AS quiz_set_id, choices.text, choices.correct').distinct

    results = quizzes.map do |quiz|
      correct_choice = quiz.choices.detect(&:correct)
      {
        question: quiz.question,
        correct_answer: correct_choice&.text,
        explanation: quiz.explanation,
        quiz_set_title: quiz.quiz_set&.title
      }
    end
  
    render json: results
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
