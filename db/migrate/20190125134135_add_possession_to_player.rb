class AddPossessionToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :possession_id, :integer
  end
end
