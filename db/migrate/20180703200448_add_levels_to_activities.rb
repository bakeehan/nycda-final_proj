class AddLevelsToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :level, :integer
  end
end
