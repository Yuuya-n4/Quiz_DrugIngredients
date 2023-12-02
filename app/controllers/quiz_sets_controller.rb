class QuizSetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_quiz_set, only: [:show, :score]

  def index
    @quiz_sets = QuizSet.all
  end

  def show
    @quizzes = @quiz_set.quizzes.order(:id)
    @first_quiz = @quizzes.first
  end

  def start_quiz
    @quiz_set = QuizSet.find(params[:id])
    @first_quiz = @quiz_set.quizzes.order(:id).first

    if @first_quiz.present?
      @score = current_user.scores.create(quiz_set: @quiz_set, correct_answer: 0)
      session[:score_id] = @score.id
      redirect_to quiz_set_quiz_path(@quiz_set, @first_quiz)
    else
      redirect_to quiz_sets_path, alert: 'クイズが見つかりません。'
    end
  end

  def score
    @score = current_user.scores.find_by(id: session[:score_id])
  end

  private

  def set_quiz_set
    @quiz_set = QuizSet.find(params[:id])
  end
end
