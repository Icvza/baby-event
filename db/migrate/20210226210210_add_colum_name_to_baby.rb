class AddColumNameToBaby < ActiveRecord::Migration[6.1]
  def change
    add_column :babies, :name, :string
    add_column :babies, :DOB, :string
  end
end
