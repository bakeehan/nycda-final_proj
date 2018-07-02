class AddLevelToMentorship < ActiveRecord::Migration[5.2]
  def change
    add_column :mentorships, :level, :integer
  end
end