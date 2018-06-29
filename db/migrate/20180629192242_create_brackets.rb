class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
