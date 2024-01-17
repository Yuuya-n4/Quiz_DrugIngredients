class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, uniqueness: { scope: :quiz_id }
end