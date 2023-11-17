class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :avatar_name, null: false
      t.integer :experience_point, null: false
      t.string :avatar_image_url, null: false

      t.timestamps
    end
  end
end
