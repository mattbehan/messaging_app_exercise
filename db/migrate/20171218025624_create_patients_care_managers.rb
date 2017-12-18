class CreatePatientsCareManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :patients_care_managers do |t|
    	t.integer :patient_id, index: true, null: false
    	t.integer :care_manager_id, index: true, null: false

      t.timestamps
    end
  end
end
