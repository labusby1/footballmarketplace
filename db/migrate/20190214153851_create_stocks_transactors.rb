class CreateStocksTransactors < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks_transactors, id: false do |t|
      t.references :transactor, foreign_key: true
      t.references :stock, foreign_key: true
    end
  end
end
