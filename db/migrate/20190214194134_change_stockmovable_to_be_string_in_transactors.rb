class ChangeStockmovableToBeStringInTransactors < ActiveRecord::Migration[5.2]
  def change
    add_column :transactors, :stocks_to_move, :text
  end
end
