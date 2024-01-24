class UserQuizPerformanceSummary < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  # ユーザーの特定のクイズにおける正確性
  def accuracy
    attempts > 0 ? (correct_answers.to_f / attempts * 100).round(2) : 0
  end

  # このクイズを苦手としているか
  def weak_subject?
    accuracy <= 80
  end

  # このクイズで最近克服したか
  def recently_improved?
    consecutive_correct_answers >= 2
  end

  # このクイズを2回以上答えたか
  def answered_twice_or_more?
    attempts >= 2
  end
end
