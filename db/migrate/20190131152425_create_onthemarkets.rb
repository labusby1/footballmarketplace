class CreateOnthemarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :onthemarkets do |t|
      t.boolean :buying
      t.integer :portfolio_id
      t.text :stocks_on_market
      t.text :least_possible
      
      t.timestamps
    end
  end
end
