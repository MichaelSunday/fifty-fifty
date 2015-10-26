class SessionsController < ApplicationController
	
	def new 
		@user = User.new
	end

	def create
		user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
		if user
			session[:user_id] = user.id
			redirect_to new_session_path
			# redirect_to messages_path
		else
			flash[:error] = 'not logged in'
		   # redirect_to new_session_path
		end   	
	end
end
