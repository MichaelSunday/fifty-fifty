class User < ActiveRecord::Base

	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
	has_many :artists
	has_many :likes, through: :artists
	has_many :dislikes, through: :artists

	has_secure_password
end