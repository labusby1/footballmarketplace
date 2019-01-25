class CreatePossessions < ActiveRecord::Migration[5.2]
  def change
    create_table :possessions do |t|
      
      t.integer :being_id
      t.timestamps
    end
  end
end
