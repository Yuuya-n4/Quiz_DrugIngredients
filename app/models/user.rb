class User < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_one :avatar, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scores, dependent: :destroy
  has_one :avatar, dependent: :destroy

  validates :name, presence: true

  def total_score_for_quiz_set(quiz_set)
    scores.where(quiz_set: quiz_set).sum(:correct_answer)
  end
end
