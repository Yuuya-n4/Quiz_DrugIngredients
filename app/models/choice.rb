class Choice < ApplicationRecord
  belongs_to :quiz
  
  validates :text, presence: true
  validates :correct, inclusion: { in: [true, false] }
end
