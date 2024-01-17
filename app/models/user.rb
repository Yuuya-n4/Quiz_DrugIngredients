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

  # ユーザーの習熟度
  def mastery_level
    summaries = user_quiz_performance_summaries.select(&:answered_twice_or_more?)
    return 0 if summaries.empty?

    weak_count = summaries.count { |summary| summary.weak_subject? && !summary.recently_improved? }
    mastered_count = summaries.count { |summary| summary.weak_subject? && summary.recently_improved? }

    total_weak_and_mastered = weak_count + mastered_count

    if total_weak_and_mastered == 0
      100
    else
      (mastered_count.to_f / total_weak_and_mastered * 100).round(2)
    end
  end

  # ユーザーが苦手としているクイズの数
  def weak_quizzes_count
    user_quiz_performance_summaries.count do |summary|
      summary.weak_subject? && !summary.recently_improved? && summary.answered_twice_or_more?
    end
  end

  # ユーザーが克服した（最近改善された）クイズの数
  def mastered_quizzes_count
    user_quiz_performance_summaries.count do |summary|
      summary.weak_subject? && summary.recently_improved? && summary.answered_twice_or_more?
    end
  end

  # ユーザーが苦手でない（正確性が80％を超える）クイズの数
  def non_weak_quizzes_count
    user_quiz_performance_summaries.count do |summary|
      summary.answered_twice_or_more? && summary.accuracy > 80
    end
  end

  # 特定のquiz_setに関するユーザーの統計情報を計算し、それをハッシュで返す
  def quiz_set_stats(quiz_set)
    total_quizzes = quiz_set.quizzes.count
    summaries = user_quiz_performance_summaries.joins(:quiz)
                  .where(quizzes: { quiz_set_id: quiz_set.id })

    answered_twice_or_more_summaries = summaries.select(&:answered_twice_or_more?)

    # 苦手な問題（克服した問題を除外）
    weak_quizzes = answered_twice_or_more_summaries.select(&:weak_subject?)
    weak_quizzes_count = weak_quizzes.count { |quiz| !quiz.recently_improved? }

    # 克服した問題
    mastered_quizzes_count = weak_quizzes.count(&:recently_improved?)

    # 定着した問題
    non_weak_quizzes_count = answered_twice_or_more_summaries.count { |summary| !summary.weak_subject? }

    {
      total_quizzes: total_quizzes,
      answered_twice_or_more_count: answered_twice_or_more_summaries.count,
      weak_quizzes_count: weak_quizzes_count,
      mastered_quizzes_count: mastered_quizzes_count,
      non_weak_quizzes_count: non_weak_quizzes_count
    }
  end
end
