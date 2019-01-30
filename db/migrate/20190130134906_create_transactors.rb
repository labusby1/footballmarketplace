class CreateTransactors < ActiveRecord::Migration[5.2]
  def change
    create_table :transactors do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.float :transaction_cost
      
      t.timestamps
    end
  end
end
