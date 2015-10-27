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
