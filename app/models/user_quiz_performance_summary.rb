class UserQuizPerformanceSummary < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  def accuracy
    attempts > 0 ? (correct_answers.to_f / attempts * 100).round(2) : 0
  end

  def weak_subject?
    accuracy <= 80
  end

  def recently_improved?
    consecutive_correct_answers >= 2
  end
end
