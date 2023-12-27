class User < ApplicationRecord
  extend Enumerize
  has_many :scores, dependent: :destroy
  has_many :user_quiz_performance_summaries, dependent: :destroy
  has_many :ratings
  has_many :feedbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :age, presence: true

  enumerize :gender, in: { male: 0, female: 1, undisclosed: 2 }, scope: true, predicates: true
  enumerize :age, in: { under_teen: 0, twenties: 1, thirties: 2, forties: 3, fifties: 4, sixties: 5, seventies_and_over: 6, undisclosed: 7 }, scope: true, predicates: true

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

  def weak_quizzes_count
    user_quiz_performance_summaries.select do |summary|
      summary.weak_subject? && !summary.recently_improved? && summary.answered_twice_or_more?
    end.count
  end

  def mastered_quizzes_count
    user_quiz_performance_summaries.select do |summary|
      summary.weak_subject? && summary.recently_improved? && summary.answered_twice_or_more?
    end.count
  end

  def non_weak_quizzes_count
    user_quiz_performance_summaries.select do |summary|
      summary.answered_twice_or_more? && summary.accuracy > 80
    end.count
  end

  def quiz_set_stats(quiz_set)
    total_quizzes = quiz_set.quizzes.count
    summaries = user_quiz_performance_summaries.joins(:quiz)
                  .where(quizzes: { quiz_set_id: quiz_set.id })

    answered_twice_or_more_summaries = summaries.select(&:answered_twice_or_more?)

    # 苦手な問題（克服した問題を除外）
    weak_quizzes = answered_twice_or_more_summaries.select(&:weak_subject?)
    weak_quizzes_count = weak_quizzes.reject(&:recently_improved?).count

    # 克服した問題
    mastered_quizzes_count = weak_quizzes.select(&:recently_improved?).count

    # 定着した問題
    non_weak_quizzes_count = answered_twice_or_more_summaries.reject(&:weak_subject?).count

    {
      total_quizzes: total_quizzes,
      answered_twice_or_more_count: answered_twice_or_more_summaries.count,
      weak_quizzes_count: weak_quizzes_count,
      mastered_quizzes_count: mastered_quizzes_count,
      non_weak_quizzes_count: non_weak_quizzes_count
    }
  end
end
