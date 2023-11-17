class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.references :quiz_set, null: false, foreign_key: true
      t.text :question, null: false
      t.integer :drug_type, null: false

      t.timestamps
    end
  end
end
