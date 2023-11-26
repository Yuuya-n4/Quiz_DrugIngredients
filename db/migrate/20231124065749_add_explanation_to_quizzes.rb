class AddExplanationToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :explanation, :text, null: false
  end
end
