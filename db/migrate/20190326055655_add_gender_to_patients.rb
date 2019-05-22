class AddGenderToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :gender, :string
  end
end
