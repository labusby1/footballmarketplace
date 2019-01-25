# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Being.create(family: "League", can_be_owned: false)
Being.create(family: "Club", can_be_owned: true)
Being.create(family: "Player", can_be_owned: true)
Being.create(family: "Manager", can_be_owned: true)
club = Possession.create(being_id: Being.find_by(family: "Club").id)
player = Possession.create(being_id: Being.find_by(family: "Player").id)
manager = Possession.create(being_id: Being.find_by(family: "Manager").id)
epl = League.create(name: "Premier League", country: "England/Wales", being_id: Being.find_by(family: "League").id)
arsenal = Club.create(name: "Arsenal", location: "North London", founded: "1900", possession_id: club.id)
epl.clubs << arsenal
championsleague = League.create(name: "Champions League", country: "Europe", being_id: 1)
chelsea = Club.create(name: "Chelsea", location: "East London", founded: "1901", possession_id: club.id)
epl.clubs << chelsea
championsleague.clubs << chelsea

Player.create(name: "Ozil", nationality: "Germany", dob: "1989", club_id: arsenal.id, possession_id: player.id)
#arsenal.players << ozil

Manager.create(name: "Emery",nationality: "Spain", dob: "1975",club_id: arsenal.id, possession_id: manager.id)


Stock.create(stock_name: "Arsenal", symbol: "ARS", active: false, trade_type: "Club", portfolio_id: nil, possession_id: club.id)