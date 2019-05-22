class Change < ActiveRecord::Migration[5.2]
  def change
  	change_column :patients, :allergies, :boolean
  	change_column :patients, :allergetic_to, :boolean
  end
end
