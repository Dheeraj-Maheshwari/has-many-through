class AddFeesToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :fees, :integer
  end
end
