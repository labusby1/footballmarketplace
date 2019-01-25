class AddPossessionToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :possession_id, :integer
  end
end
