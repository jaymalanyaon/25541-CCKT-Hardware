class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :order_quantity
      t.decimal :order_total
      t.decimal :item_price
      t.date :order_date

      t.timestamps
    end
  end
end
