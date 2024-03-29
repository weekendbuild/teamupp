class SessionsController < ApplicationController
	
	def create
	  auth = request.env["omniauth.auth"]
	  user = User.find_or_create_by(username: auth.info.nickname)
	  user.setup_omniauth(auth) unless user.registered?

	  session[:user_id] = user.id
	  redirect_to root_url, :notice => "Signed in!"
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Signed out!"
	end
	
end
