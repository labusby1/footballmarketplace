class CreateClubsLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs_leagues, id: false do |t|
      t.references :league, foreign_key: true
      t.references :club, foreign_key: true
    end
  end
end
