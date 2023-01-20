p "Where are you located"

user_location = gets.chomp
p user_location


gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{ENV.fetch("GMAPS_KEY")}"

require("open-uri")

raw_data = URI.open(gmaps_url).read

require "json"

parsed_data = JSON.parse(raw_data)

results_array = parsed_data.fetch("results")

only_result = results_array[0] 

geo =  only_result.fetch("geometry")

loc = geo.fetch("location")

p latitude = loc.fetch("lat")
p longitude = loc.fetch("lng")



# Lat for Chic : 41.8781136
# Long for Chic : -87.6297982
dark_sky_url = "https://api.darksky.net/forecast/#{ENV.fetch("DARK_SKY_KEY")}/41.8781136,-87.6297982"
