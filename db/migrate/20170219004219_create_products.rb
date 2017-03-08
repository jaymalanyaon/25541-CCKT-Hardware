class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.decimal :product_price
      t.integer :product_stock

      t.timestamps
    end
  end
end
