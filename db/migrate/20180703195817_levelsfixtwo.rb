class Levelsfixtwo < ActiveRecord::Migration[5.2]
  def change
  	    change_column_default :brackets, :level_system, "['beginner','intermediate','advanced']"
  	    change_column_default :mentorships, :level, 0
  end
end
