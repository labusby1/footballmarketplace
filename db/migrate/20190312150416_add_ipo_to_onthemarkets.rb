class AddIpoToOnthemarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :onthemarkets, :ipo, :boolean, default: false
  end
end
