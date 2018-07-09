class AddAvatarToBrackets < ActiveRecord::Migration[5.2]
  def change
    add_column :brackets, :avatar, :string
  end
end
