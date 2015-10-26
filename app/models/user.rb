class User < ActiveRecord::Base
	has_many :likes
	has_many :dislikes

	has_many :user_messages
	has_many :messages, through: :user_message

	has_secure_password
end