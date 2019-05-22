class ChangePatientIdToBeIntegerInAppointments < ActiveRecord::Migration[5.2]
  def change
  	  change_column :appointments, :patient_id, :integer
  end
end
