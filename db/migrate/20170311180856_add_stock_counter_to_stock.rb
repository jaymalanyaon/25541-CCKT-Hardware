class AddStockCounterToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :stock_counter, :integer
  end
end
