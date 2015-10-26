class User < ActiveRecord::Base
	has_many :artists
	has_many :likes, through: :artists
	has_many :dislikes, :through :artists

	has_secure_password
end