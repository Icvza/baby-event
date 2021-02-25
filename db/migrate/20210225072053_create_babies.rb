class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|

      t.timestamps null: false
    end
  end
end
