#-----------------------------------Seeds---------------------------------------






#-------------------------------------------------------------------------------
#------------------------------Beings-------------------------------------------
Being.create(family: "League", can_be_owned: false)
Being.create(family: "Club", can_be_owned: true)
Being.create(family: "Player", can_be_owned: true)
Being.create(family: "Manager", can_be_owned: true)

#------------------------------Possessions--------------------------------------
club = Possession.create(being_id: Being.find_by(family: "Club").id)
player = Possession.create(being_id: Being.find_by(family: "Player").id)
manager = Possession.create(being_id: Being.find_by(family: "Manager").id)

#------------------------------Leagues------------------------------------------
epl = League.create(name: "Premier League", country: "England/Wales", being_id: Being.find_by(family: "League").id)
championsleague = League.create(name: "Champions League", country: "Europe", being_id: 1)

#-------------------------------------------------------------------------------
# https://raw.githubusercontent.com/drraq/PremierLeague.json/master/data.json
#-------------------------------------------------------------------------------
# Add acknowledgement of this guys website sometime. Mention the copyright thing
# he has. 
require 'open-uri'
require 'nokogiri'
require 'json'

doc = open('https://raw.githubusercontent.com/drraq/PremierLeague.json/master/data.json')
file = File.read(doc)
data_hash = JSON.parse(file)
for i in 0..19
  Club.create(name: data_hash["clubs"][i]["name"], location: data_hash["clubs"][i]["stadium"], founded: "2019", possession_id: club.id)
  epl.clubs << Club.find(i+1)
end

#-- arsenal players --
num_of_players = data_hash["players"].length
for i in 0..num_of_players
  if data_hash["players"][i]["current_club"] == "Arsenal"
    #Player.create(name: data_hash["players"][i]["last_name"], nationality: data_hash["players"][i]["nationality"], dob: "2019", club_id: Club.find_by(name: "Arsenal").id, possession_id: player.id)
  end
end
