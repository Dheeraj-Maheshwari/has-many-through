class AddAllergeticToToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :allergetic_to, :string
  end
end
