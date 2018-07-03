class Defaultlevelsfuck < ActiveRecord::Migration[5.2]
  def change
  	    change_column_default :brackets, :level_system, "[[1,'beginner'],[2,'intermediate'],[3,'advanced']]"
  end
end
