class AddStockNameToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :stock_name, :string
  end
end
