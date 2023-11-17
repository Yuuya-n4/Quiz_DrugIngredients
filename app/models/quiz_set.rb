class QuizSet < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :quizzes, dependent: :destroy
end
