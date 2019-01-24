class CreateClub < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :location
      t.string :founded
      
      t.timestamps
    end
  end
end
