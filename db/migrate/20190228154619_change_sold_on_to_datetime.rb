class ChangeSoldOnToDatetime < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactors, :sold_on
    add_column :transactors, :sold_on, :datetime
  end
end
