class Levelsfixes < ActiveRecord::Migration[5.2]
  def change
  	remove_column :mentorships, :level_name
  	remove_column :activities, :build_array
    add_column :brackets, :level_system, :text
  end
end
