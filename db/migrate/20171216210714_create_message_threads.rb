class CreateMessageThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :message_threads do |t|

    	t.integer :provider_id, index: true, null: false
    	t.integer :patient_id, index: true, null: false

    	add_index :message_threads, [:provider_id, :patient_id], unique: true

      t.timestamps
    end
  end
end
