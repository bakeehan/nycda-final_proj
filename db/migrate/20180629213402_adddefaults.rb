class Adddefaults < ActiveRecord::Migration[5.2]
  def change
  	    change_column_default :users, :is_admin, false
  	    change_column_default :mentorships, :student_type, "User"
  	    change_column_default :mentorships, :teacher_type, "User"
  	    change_column_default :mentorships, :is_complete, false
  	    change_column_default :achievements, :is_private, false
  end
end
