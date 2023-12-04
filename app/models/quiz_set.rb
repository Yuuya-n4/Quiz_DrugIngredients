class QuizSet < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  accepts_nested_attributes_for :quizzes, allow_destroy: true

  def completed_by?(user)
    quizzes.count == user.scores.where(quiz_set: self).count
  end
end
