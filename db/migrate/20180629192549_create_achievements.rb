class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.integer :activity_id
      t.integer :user_id
      t.boolean :is_private
      t.string :title
      t.text :content
      t.integer :mentorship_id

      t.timestamps
    end
  end
end
