class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.references :customer, null: false
      t.string :type, null: false
      t.string :current_mac, null: false
      t.date   :start_current_mac, null: false
      t.date   :end_current_mac, null: false, defalut: Time.now
      t.string :old_mac, null: false
      t.date   :create_old_mac, null: false, defalut: Time.now
      t.date :broken 
      t.timestamps
    end

    add_index :machines, [ :type, :customer_id ], unique: true
    add_index :machines, :current_mac, :unique => true
    add_index :machines, :old_mac
    add_foreign_key :machines, :customers
  end
end
