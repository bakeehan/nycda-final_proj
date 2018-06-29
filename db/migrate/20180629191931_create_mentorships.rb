class CreateMentorships < ActiveRecord::Migration[5.2]
  def change
    create_table :mentorships do |t|
      t.string :title
      t.boolean :is_complete
      t.date :end_date
      t.integer :bracket_id
      t.references :teacher, polymorphic: true, index: true
      t.references :student, polymorphic: true, index: true

      t.timestamps
    end
  end
end
