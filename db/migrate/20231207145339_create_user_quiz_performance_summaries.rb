class CreateUserQuizPerformanceSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :user_quiz_performance_summaries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.integer :attempts, default: 0
      t.integer :correct_answers, default: 0

      t.timestamps
    end
  end
end
