class Quiz < ApplicationRecord
  extend Enumerize

  belongs_to :quiz_set
  has_many :choices, dependent: :destroy
  has_many :user_quiz_performance_summaries, dependent: :destroy
  has_many :ratings
  
  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :drug_type, presence: true, numericality: { only_integer: true, greater_than: 0 }

  enumerize :drug_type, in: { medicine: 1, quasi_drug: 2, cosmetics: 3 }, scope: true

  def correct_choice?(choice)
    correct_choice = choices.find_by(correct: true)
    correct_choice == choice
  end

  def correct_choice
    choices.find_by(correct: true)
  end

  scope :search_multiple_fields, ->(query) {
    return if query.blank?

    joins(:choices, :quiz_set)
      .where('quizzes.question ILIKE :query OR quizzes.explanation ILIKE :query OR quiz_sets.title ILIKE :query OR choices.text ILIKE :query AND choices.correct = true', query: "%#{query}%")
  }
end
