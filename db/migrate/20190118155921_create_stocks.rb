class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :stock_name
      t.string :symbol
      t.boolean :active
      t.string :trade_type
      
      t.timestamps
    end
  end
end
