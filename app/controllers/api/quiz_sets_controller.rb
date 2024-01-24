module Api
  class QuizSetsController < ApplicationController
      skip_before_action :verify_authenticity_token

    def index
      quiz_sets = QuizSet.all
      render json: quiz_sets
    end
  end
end