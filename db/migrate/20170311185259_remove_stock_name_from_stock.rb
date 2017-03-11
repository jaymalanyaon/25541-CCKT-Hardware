class RemoveStockNameFromStock < ActiveRecord::Migration[5.0]
  def change
    remove_column :stocks, :stock_name, :integer
  end
end
