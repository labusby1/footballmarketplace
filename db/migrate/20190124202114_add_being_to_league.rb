class AddBeingToLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :being_id, :integer
  end
end
