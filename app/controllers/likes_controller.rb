class LikesController < ApplicationController
	def index
		user_id = params[:user_id]
		spotify_id = params[:spotify_id] #6Bygk8YvDJTfJSuY5ccUJH
		artist = Artist.find_by spotify_id: spotify_id
			if !artist 
				artist = Artist.create(spotify_id: spotify_id)
			end

	end
end
