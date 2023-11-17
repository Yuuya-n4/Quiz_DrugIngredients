class QuizSetsController < ApplicationController
  def index
    @quiz_sets = QuizSet.all
  end

  def show
    @quiz_set = QuizSet.find(params[:id])
  end
end
