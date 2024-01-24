class Quiz < ApplicationRecord
  extend Enumerize

  belongs_to :quiz_set
  has_many :choices, dependent: :destroy
  has_many :user_quiz_performance_summaries, dependent: :destroy
  has_many :ratings, dependent: :destroy
  
  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :drug_type, presence: true, numericality: { only_integer: true, greater_than: 0 }

  enumerize :drug_type, in: { medicine: 1, quasi_drug: 2, cosmetics: 3 }, scope: true

  # 与えられたchoice（選択肢）が正しいかどうか
  def correct_choice?(choice)
    correct_choice == choice
  end

  # 正しい選択肢
  def correct_choice
    choices.find_by(correct: true)
  end
end
