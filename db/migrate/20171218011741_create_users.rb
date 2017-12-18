class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.references :identifiable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
