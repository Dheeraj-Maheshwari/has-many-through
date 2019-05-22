class AddAllergiesToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :allergies, :string
  end
end
