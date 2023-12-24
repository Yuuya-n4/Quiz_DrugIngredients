class FeedbacksController < ApplicationController

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:feedback_notice] = 'フィードバックを送信しました。ありがとうございます！'
      redirect_to score_quiz_set_path(@feedback.quiz_set_id)
    else
      flash[:feedback_alert] = 'エラーです。'
      redirect_to score_quiz_set_path(@feedback.quiz_set_id)
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:quiz_set_id, :user_id, :content)
  end
end
