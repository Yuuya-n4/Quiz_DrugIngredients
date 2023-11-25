class QuizSetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_quiz_set, only: [:show, :score]

  def index
    @quiz_sets = QuizSet.all
  end

  def show
    @quizzes = @quiz_set.quizzes.order(:id)
    @first_quiz = @quizzes.first
    @score = current_user.scores.create(quiz_set: @quiz_set, correct_answer: 0)
    session[:score_id] = @score.id
  end

  def score
    @score = current_user.scores.find_by(id: session[:score_id])
  end

  private

  def set_quiz_set
    @quiz_set = QuizSet.find(params[:id])
  end
end
