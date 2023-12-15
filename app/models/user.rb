class User < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_one :avatar, dependent: :destroy
  has_many :user_quiz_performance_summaries, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

  def total_score_for_quiz_set(quiz_set)
    scores.where(quiz_set: quiz_set).sum(:correct_answer)
  end

  def mastery_level
    return 0 if user_quiz_performance_summaries.empty?
    
    weak_count = weak_quizzes_count
    mastered_count = mastered_quizzes_count

    total_weak_and_mastered = weak_count + mastered_count

    if total_weak_and_mastered == 0
      100
    else
      (mastered_count.to_f / total_weak_and_mastered * 100).round(2)
    end
  end

  def non_weak_quizzes_count
    user_quiz_performance_summaries.reject(&:weak_subject?).count
  end

  def weak_quizzes_count
    user_quiz_performance_summaries.select do |summary|
      summary.weak_subject? && summary.consecutive_correct_answers < 2
    end.count
  end

  def mastered_quizzes_count
    user_quiz_performance_summaries.select do |summary|
      summary.weak_subject? && summary.consecutive_correct_answers >= 2
    end.count
  end
end
