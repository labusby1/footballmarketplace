class AddSoldOnToTransactors < ActiveRecord::Migration[5.2]
  def change
    add_column :transactors, :sold_on, :date
    add_column :transactors, :stock_symbol, :string
  end
end
