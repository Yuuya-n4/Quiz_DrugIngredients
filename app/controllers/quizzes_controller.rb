class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz_set, only: [:show, :answer, :explanation]
  before_action :set_quiz, only: [:show, :answer, :explanation]

  def show
    @choices = @quiz.choices
  end

  def answer
    choice = Choice.find(params[:choice_id])
    correct = @quiz.correct_choice?(choice)
    score_record = current_user.scores.find(session[:score_id])
    score_record.correct_answer += 1 if correct
    score_record.save!

    redirect_to explanation_quiz_set_quiz_path(@quiz_set, @quiz)
  end

  def explanation
    @next_quiz = @quiz_set.quizzes.where('id > ?', @quiz.id).first
  end

  def index
    @q = Quiz.ransack(params[:q])
    @quizzes = @q.result(distinct: true).order(:created_at)
  end

  private

  def set_quiz_set
    @quiz_set = QuizSet.find(params[:quiz_set_id])
  end

  def set_quiz
    @quiz = @quiz_set.quizzes.find(params[:id])
  end
end
