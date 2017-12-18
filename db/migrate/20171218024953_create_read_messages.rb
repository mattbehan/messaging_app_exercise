class CreateReadMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :read_messages do |t|

    	t.integer :message_id, index: true, null: false
    	t.integer :user_id, index: true, null: false
    	t.boolean :read, default: false

      t.timestamps
    end
  end
end
