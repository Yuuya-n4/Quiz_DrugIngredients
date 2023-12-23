class Feedback < ApplicationRecord
  belongs_to :quiz_set
  belongs_to :user

  validates :content, presence: true
  validates :content, presence: true, length: { maximum: 300 } 
end
