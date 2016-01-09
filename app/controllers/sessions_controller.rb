class SessionsController < ApplicationController
	def login
		user = User.find_by(email: params[:loginemail])
		if user && user.authenticate(params[:loginpassword])
			session[:username] = user.first_name
			session[:user_id] = user.id
			redirect_to '/users'
		else
			redirect_to '/'
		end
	end

	def logout
        session[:user_id] = nil
        redirect_to '/'
    end
end
