module Api
  class QuizSetsController < ApplicationController
      skip_before_action :verify_authenticity_token

    def index
      quiz_sets = QuizSet.all
      puts "Sending Quiz Sets: #{quiz_sets.inspect}"
      render json: quiz_sets
    end
  end
end