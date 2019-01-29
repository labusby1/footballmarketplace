class ChangeTradeTypeTobeingId < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :trade_type
    add_column :stocks, :being_id, :integer
  end
end
