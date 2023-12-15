class QuizSetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_quiz_set, only: [:show, :score]
  layout 'quiz', only: [:score]

  def index
    @quiz_sets = QuizSet.all
    @mastery_level = current_user.mastery_level if user_signed_in?
  end

  def show
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
    @score = current_user.scores.find_by(id: session[:score_id])
    @total_quizzes = session[:original_quiz_ids].length
  end

  private

  def set_quiz_set
    @quiz_set = QuizSet.find_by(id: params[:id])
    redirect_to(quiz_sets_path, alert: '指定されたクイズセットが見つかりません。') unless @quiz_set
  end
end
