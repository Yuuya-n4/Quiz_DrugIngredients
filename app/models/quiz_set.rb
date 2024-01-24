class QuizSet < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  accepts_nested_attributes_for :quizzes, allow_destroy: true

  # 特定のユーザーが答えたクイズの数を返す
  def answered_quizzes_count(user)
    quizzes.joins(:user_quiz_performance_summaries)
           .where(user_quiz_performance_summaries: { user_id: user.id })
           .distinct
           .count
  end

  # クイズセット内のクイズの総数
  def total_quizzes_count
    quizzes.count
  end
end
