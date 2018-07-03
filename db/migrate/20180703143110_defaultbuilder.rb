class Defaultbuilder < ActiveRecord::Migration[5.2]
  def change
  	    change_column_default :activities, :build_array, '[["text_area", "content"]]'
  end
end
