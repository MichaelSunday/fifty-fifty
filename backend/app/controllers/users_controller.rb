class UsersController < ApplicationController

  def index
  	@user_id = session[:user_id]
  	@user = User.find(@user_id)
  	artists = RSpotify::Artist.search('Vince Staples')
	arctic_monkeys = artists.first
	@test = arctic_monkeys.related_artists 
	# artist = Echonest::Artist.new('Weezer')
	# @test = artist.name


  end

  def show

  end

  def new
		@user = User.new

  end

  def create
		user = User.new(user_params)
    
		if user.save
			flash[:success] = "Welcome!"
      		render json: {:id => user.id, :name => user.name, :email => user.email}
		else
			render json: {:status => "Not created"}
		end
  end


  def user_params
    	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end


  
  #   class AuthToken
  #     def self.encode(payload, exp=24.hours.from_now)
  #     payload[:exp] = exp.to_i
  #     JWT.encode(payload, Rails.application.secrets.secret_key_base)

  #   def self.decode(token)
  #     payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
  #     DecodedAuthToken.new(payload)
  #   rescue
  #     nil # It will raise an error if it is not a token that was generated with our secret key or if the user changes the contents of the payload
  #   end
  # end

  # # We could just return the payload as a hash, but having keys with indifferent access is always nice, plus we get an expired? method that will be useful later
  # class DecodedAuthToken < HashWithIndifferentAccess
  #   def expired?
  #     self[:exp] <= Time.now.to_i
  #   end
  # end


