class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.integer :portfolio_id
      t.float :purchase_price
      
      t.timestamps
    end
  end
end
