# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
epl = League.create(name: "Premier League", country: "England/Wales", being_id: Being.find_by(family: "League").id)
arsenal = Club.create(name: "Arsenal", location: "North London", founded: "1900")
epl.clubs << arsenal
championsleague = League.create(name: "Champions League", country: "Europe", being_id: 1)
chelsea = Club.create(name: "Chelsea", location: "East London", founded: "1901")
epl.clubs << chelsea
championsleague.clubs << chelsea