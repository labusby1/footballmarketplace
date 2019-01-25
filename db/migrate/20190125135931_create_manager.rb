class CreateManager < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :nationality
      t.string :dob
      
      t.integer :club_id
      t.integer :possession_id
      t.timestamps
    end
  end
end
