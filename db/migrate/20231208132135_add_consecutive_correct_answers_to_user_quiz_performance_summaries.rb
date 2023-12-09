class AddConsecutiveCorrectAnswersToUserQuizPerformanceSummaries < ActiveRecord::Migration[7.0]
  def change
    add_column :user_quiz_performance_summaries, :consecutive_correct_answers, :integer, default: 0
  end
end
