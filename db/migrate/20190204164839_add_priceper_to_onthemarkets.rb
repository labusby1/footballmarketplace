class AddPriceperToOnthemarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :onthemarkets, :price_per, :float
  end
end
