class SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def new 
		@user = User.new
	end

	def create
		user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
		if user
			puts "success"
			session[:user_id] = user.id
			render json: {:id => user.id, :name => user.name, :email => user.email}
			# redirect_to home_page_path
			# redirect_to messages_path
		else
			puts "errrrror"
			render json: {:status => "ERROR NOT LOGGED IN"}
			# flash[:error] = 'not logged in'
		   # redirect_to new_session_path
		end   	
	end
end
