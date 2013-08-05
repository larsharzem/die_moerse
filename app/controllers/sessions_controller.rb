class SessionsController < ApplicationController

	# displays login form
	def new
		puts "session new"
	end

	# POST login action
	def create
		user = User.authenticate params[:email], params[:password]
		if user
			if user.inactive == "true" || user.inactive == true
				redirect_to home_path, :notice => "Ihr Benutzerkonto ist inaktiv. Lassen Sie sich ein neues Passwort zuschicken um es zu aktivieren!"
			else
				session[:user] = user
				if (user.created_at > Time.now - 1800)
					session[:first_time] = true
				else
					session[:first_time] = false
				end
				redirect_to (dashboard_path, :notice => "Willkommen zurück, " + user.name + "!")
			end
		else
			flash[:notice] = "E-Mail oder Passwort stimmen nicht überein."
			render 'new'
		end
	end

	# DELETE logout action
	def destroy
		userid = session[:user].id
		session[:user] = nil
		redirect_to home_path, :notice => "Sie wurden ausgeloggt!"
	end
end