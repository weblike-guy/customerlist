class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :deposit
      t.timestamps
    end
      add_index :customers, :name
      add_index :customers, :created_at
  end
end
