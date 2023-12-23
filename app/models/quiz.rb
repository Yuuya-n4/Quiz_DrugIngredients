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

  def self.ransackable_attributes(auth_object = nil)
    %w[question explanation]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[quiz_set choices]
  end

  def self.ransackable_scopes(auth_object = nil)
    %i[combined_search]
  end

  def self.combined_search(query)
    return all if query.blank?

    joins(:quiz_set, :choices)
      .where('quizzes.question LIKE ?
              OR quizzes.explanation LIKE ?
              OR quiz_sets.title LIKE ?
              OR (choices.text LIKE ? AND choices.correct = ?)',
             "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", true)
      .distinct
  end
end
