class CreateBeing < ActiveRecord::Migration[5.2]
  def change
    create_table :beings do |t|
      t.string :family
      t.boolean :can_be_owned
      
      t.timestamps
    end
  end
end
