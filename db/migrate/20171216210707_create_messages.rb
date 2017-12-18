class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|

    	t.integer :message_thread_id, index: true, null: false
    	t.integer :creator_id, index: true, null: false
    	t.text :message_text, null: false

      t.timestamps
    end
  end
end
