class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.integer :user_id
      t.string :bus

      t.timestamps
    end
  end
end
