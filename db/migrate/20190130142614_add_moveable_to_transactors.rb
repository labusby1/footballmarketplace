class AddMoveableToTransactors < ActiveRecord::Migration[5.2]
  def change
    add_column :transactors, :moveable, :text
  end
end
