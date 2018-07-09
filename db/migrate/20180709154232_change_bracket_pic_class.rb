class ChangeBracketPicClass < ActiveRecord::Migration[5.2]
  def change
  	rename_column :brackets, :avatar, :icon
  	rename_column :brackets, :avatar_dominant_color, :icon_dominant_color
  end
end
