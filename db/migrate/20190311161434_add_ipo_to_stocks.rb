class AddIpoToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :ipo, :boolean, default: false
  end
end
