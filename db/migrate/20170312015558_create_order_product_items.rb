class CreateOrderProductItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_product_items do |t|
      t.integer :ord_id
      t.string :prod_name
      t.integer :quant

      t.timestamps
    end
  end
end
