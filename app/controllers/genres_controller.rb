class GenresController < ApplicationController
	def index
		require 'echonest-ruby-api'
		#genre = Echonest::Genre.new('39KJKWMRSLX8ZQVZN', 'folk rock')
		render json: Echonest::Genre.list('39KJKWMRSLX8ZQVZN')
	end
end
