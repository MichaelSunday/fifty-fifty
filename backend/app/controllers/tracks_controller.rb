class TracksController < ApplicationController

	def index
		search = params[:genre]
		genre = Echonest::Genre.new('39KJKWMRSLX8ZQVZN', search)
		artists_list = genre.artists[:artists]
		name = artists_list.sample[:name]
		artists = RSpotify::Artist.search(name)
		artist = artists.first
		albums = artist.albums
		album = albums.sample
		tracks = album.tracks
		track = tracks.sample
		render json: track
	end
end
