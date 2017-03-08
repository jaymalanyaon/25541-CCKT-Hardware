class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.integer :supplier_id
      t.string :supplier_name
      t.text :supplier_address
      t.date :shipment_date
      t.decimal :shipment_amount

      t.timestamps
    end
  end
end
