class QuizSet < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  accepts_nested_attributes_for :quizzes, allow_destroy: true

  def completed_by?(user)
    quizzes.count == user.scores.where(quiz_set: self).count
  end

  def answered_quizzes_count(user)
    quizzes.joins(:user_quiz_performance_summaries)
           .where(user_quiz_performance_summaries: { user_id: user.id })
           .distinct
           .count
  end

  def total_quizzes_count
    quizzes.count
  end
end
