class AddAvatarDominantColorToBrackets < ActiveRecord::Migration[5.2]
  def change
    add_column :brackets, :avatar_dominant_color, :string
  end
end
