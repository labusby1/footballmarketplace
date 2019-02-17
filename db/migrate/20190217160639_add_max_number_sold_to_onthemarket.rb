class AddMaxNumberSoldToOnthemarket < ActiveRecord::Migration[5.2]
  def change
    add_column :onthemarkets, :max_number_sold, :integer
  end
end
