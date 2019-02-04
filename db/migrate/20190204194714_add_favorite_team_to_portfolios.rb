class AddFavoriteTeamToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :favorite_team, :string
  end
end
