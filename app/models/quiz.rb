class Quiz < ApplicationRecord
  belongs_to :quiz_set
  has_many :choices, dependent: :destroy
end
