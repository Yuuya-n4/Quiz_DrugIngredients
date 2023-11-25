class Quiz < ApplicationRecord
  belongs_to :quiz_set
  has_many :choices, dependent: :destroy

  validates :drug_type, presence: true, numericality: { only_integer: true, greater_than: 0 }

  enum drug_type: {
    cold_medicine: 1,
    digestive_medicine: 2,
    herbal_medicine: 3
  }

  def correct_choice?(choice)
    correct_choice = choices.find_by(correct: true)
    correct_choice == choice
  end

  def correct_choice
    choices.find_by(correct: true)
  end
end
