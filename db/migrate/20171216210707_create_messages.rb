class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|

    	t.references :message_thread, index: true, null: false
    	t.integer :author, index: true, null: false
    	t.text :message_text, null: false
    	t.boolean :read_by_recipient, default: false

      t.timestamps
    end
  end
end
