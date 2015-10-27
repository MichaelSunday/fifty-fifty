class DislikesController < ApplicationController
	def index
		user_id = params[:user_id]
		spotify_id = params[:spotify_id]
		artist = Artist.find_by spotify_id: spotify_id
			if !artist
				artist = Artist.create(spotify_id: spotify_id)
			end
		artist_id = artist.id
			dislike = Dislike.create(artist_id: artist_id, user_id: user_id)
		original_artist = RSpotify::Artist.find(spotify_id)	
		related_artists = original_artist.related_artists
		random_artist = related_artists.sample
		albums = random_artist.albums
		album = albums.sample
		tracks = album.tracks
		track = tracks.sample
		render json: track
	end
end

