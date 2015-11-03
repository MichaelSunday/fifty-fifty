class LikesController < ApplicationController
	def index
		user_id = params[:user_id]
		spotify_id = params[:spotify_id] #6Bygk8YvDJTfJSuY5ccUJH
		artist = Artist.find_by spotify_id: spotify_id
			if !artist 
				artist = Artist.create(spotify_id: spotify_id)
			end
		artist_id = artist.id
				like = Like.create(artist_id: artist_id, user_id: user_id)
			# render json:{:user_id => user_id, :artist_id => artist_id}
		original_artist = RSpotify::Artist.find(spotify_id)	
		related_artists = original_artist.related_artists
		random_artist = related_artists.sample
		albums = random_artist.albums
		album = albums.sample
		tracks = album.tracks
		track = tracks.sample
		render json: track

	
	end
	def oki
		user_id = params[:user_id]
		@like = Like.where(user_id: user_id).all
		@like_data = []
		@like.each do |like|
			artist_i = Artist.find(like.artist_id)
			@like_data.push(artist_i)
			# puts artist_i
			# artist_name = artist_i.name
			# artist = {"artist" => artist_name}
			# like = JSON::parse(like.to_json).merge(artist)
			# puts "YOOOOOOOOOOOo"
			# @like_data << like
			# puts artist_name
		end
		render json: @like_data
		# respond_to do |format|
		# 	format.html
		# 	format.json { :json => @like_data}
		# end

	end
end
