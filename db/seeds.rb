#-----------------------------------Seeds---------------------------------------

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

require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open("http://www.footballsquads.co.uk/eng/2018-2019/engprem.htm"))

club_entries= doc.css('h5')

for i in 0..19
    Club.create(name: club_entries[i].css('a').text, location: nil, founded: nil, possession_id: club.id)
    club_entries
    doc2 = Nokogiri::HTML(open(""))
end


#-------------------------------------------------------------------------------
# https://raw.githubusercontent.com/drraq/PremierLeague.json/master/data.json
#-------------------------------------------------------------------------------
# Add acknowledgement of this guys website sometime. Mention the copyright thing
# he has. 
require 'open-uri'
require 'nokogiri'
require 'json'
