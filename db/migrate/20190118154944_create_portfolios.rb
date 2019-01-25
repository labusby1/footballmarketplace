class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.float :balance
      t.float :net_worth
      
      t.timestamps
    end
  end
end
