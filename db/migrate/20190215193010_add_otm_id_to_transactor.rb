class AddOtmIdToTransactor < ActiveRecord::Migration[5.2]
  def change
    add_column :transactors, :otm_id, :integer
  end
end
