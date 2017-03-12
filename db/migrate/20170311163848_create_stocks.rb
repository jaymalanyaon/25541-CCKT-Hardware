class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :stock_quantity
      t.integer :stock_name
      t.decimal :stock_price
      t.decimal :stock_payment

      t.timestamps
    end
  end
end
