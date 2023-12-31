class Score < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_set

  validates :correct_answer, presence: true

  def increment_correct_answers!
    increment!(:correct_answer)
  end

  def total_questions
    quiz_set.quizzes.count
  end
end
