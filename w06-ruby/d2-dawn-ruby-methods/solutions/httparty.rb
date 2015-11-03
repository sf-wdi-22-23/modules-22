## Using a Gem ##
require "httparty"

def spotify_album_search (word="White") # optionally take a parameter
	# uri = "https://api.spotify.com/v1/search?q=White&type=album" # <- "White"-only version
	uri = "https://api.spotify.com/v1/search?q=#{word}&type=album" # <- using parameter
	# do an album search on the word
	response = HTTParty.get(uri)
	# parse response body into JSON
	body = JSON.parse(response.body)
	# print each of the album names
	body["albums"]["items"].each do |a|
	  puts a["name"]
	end
	# return parsed response body
	body
end

spotify_album_search 
