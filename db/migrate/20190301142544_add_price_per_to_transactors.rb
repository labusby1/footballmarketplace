class AddPricePerToTransactors < ActiveRecord::Migration[5.2]
  def change
    add_column :transactors, :price_per, :float
  end
end
