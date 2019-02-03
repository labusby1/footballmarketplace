class RemoveStocksOnMarketFromOnthemarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :onthemarkets, :stocks_on_market
    remove_column :onthemarkets, :least_possible
    add_column :onthemarkets, :stocks_on_market, :text
    add_column :onthemarkets, :ideal_number_sold, :integer
    add_column :onthemarkets, :least_possible, :integer
  end
end
