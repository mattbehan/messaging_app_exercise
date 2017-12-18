class CreateMessageThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :message_threads do |t|

    	t.integer :patient_id, index: true, null: false

      t.timestamps
    end
  end
end
