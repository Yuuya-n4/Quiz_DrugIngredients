class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz_set, null: false, foreign_key: true
      t.integer :correct_answer, null: false, default: 0

      t.timestamps
    end
  end
end
