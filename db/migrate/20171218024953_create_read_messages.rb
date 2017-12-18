class CreateReadMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :read_messages do |t|

      t.timestamps
    end
  end
end
