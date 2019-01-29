class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.float :transaction_cost
      t.integer :hash_of_stocks
      t.timestamps
    end
  end
end
