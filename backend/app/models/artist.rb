class Artist < ActiveRecord::Base
	has_many :likes, through: :users
	has_many :dislikes, through: :users
end
