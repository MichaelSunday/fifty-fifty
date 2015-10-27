class ArtistsController < ApplicationController
	acts_as_votable
	def index
		@artist = Artist.new(:name => 'my artist!')
		@artist.save

		@artist.liked_by @user
		@artist.votes_for.size # => 1
	end
end

