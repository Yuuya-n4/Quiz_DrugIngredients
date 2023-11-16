class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :quiz, null: false, foreign_key: true
      t.text :text, null: false
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
