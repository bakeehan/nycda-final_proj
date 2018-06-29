class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :bracket_id
      t.string :title
      t.text :description
      t.text :build_array

      t.timestamps
    end
  end
end
