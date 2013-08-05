class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.find(:all, :conditions => ["inactive != ?", true])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @products = Product.find(:all, :conditions => ["userId = ? AND inactive != ?", @user.id, true])
    
	@bargainsProposed = Bargain.find(:all, :conditions => {:userId1 => @user.id, :status => "1"})
	@bargainsAccepted = Bargain.find(:all, :conditions => {:userId2 => @user.id, :status => "1"})
  end

  # GET /users/1
  # GET /users/1.json
  def dashboard
	if session[:user]
		@user = User.find(session[:user].id)
		@products = Product.find(:all, :conditions => ["userId = ? AND inactive != ?", @user.id, true])
		
		@bargainsProposed = Bargain.find(:all, :conditions => {:userId1 => @user.id, :status => "1"})
		@bargainsAccepted = Bargain.find(:all, :conditions => {:userId2 => @user.id, :status => "1"})
		
		@bargainsPending = Bargain.find(:all, :conditions => {:userId1 => @user.id, :status => "0"})
		@bargainsPending += Bargain.find(:all, :conditions => {:userId2 => @user.id, :status => "0"})
	else
		redirect_to home_path
		flash[:notice] = "Sind sind nicht eingeloggt."
	end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
	if session[:user].nil? 
		redirect_to @user
		flash[:notice] = "Sie sind nicht als dieser Benutzer eingeloggt."
	elsif session[:user].id != @user.id
		redirect_to @user
		flash[:notice] = "Sie sind nicht als dieser Benutzer eingeloggt."
	end
  end

	# POST /users
	# POST /users.json
	def create
		#puts "CREATING USER"
		@user = User.new(params[:user])
		@user.views = 0
		@user.inactive = false
		if @user.save
			user = User.authenticate params[:user][:email], params[:user][:password]
			if user
				Emailer.sendWelcome(@user).deliver
				session[:user] = user
				redirect_to dashboard_path
				flash[:notice] = "Das Profil wurde erfolgreich erstellt."
			else
				@user.destroy
				render :new
				flash[:notice] = 'Etwas hat unerwarteterweise nicht geklappt. Bitte versuchen Sie es erneut.'
			end
		else
			render :new
			flash[:notice] = 'Etwas hat unerwarteterweise nicht geklappt. Bitte versuchen Sie es erneut.'
		end
	end
  
	def resetPassword
		if params && params[:email] != nil
			@user = User.find_by_email(params[:email])
			if @user.present?
				newPw = random_password(12)
				@user.update_attributes({:password => newPw, :inactive => false})
				Emailer.sendPassword(params[:email], "Neues Passwort für die Mörse", newPw).deliver
				redirect_to users_path
				flash[:notice] = "Ein neues Passwort wurde generiert und an " + params[:email] + " geschickt."
			else
				redirect_to resetPassword_path
				flash[:notice] = "Kein Benutzer mit der Email-Adresse '" + params[:email] + "' gefunden."
			end
		end
	end

	# PUT /users/1
	# PUT /users/1.json
	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
			session[:user] = @user
			redirect_to @user
			flash[:notice] = "Das Benutzerkonto wurde erfolgreich aktualisiert."
		else
			render :edit
			flash[:notice] = 'Etwas hat unerwarteterweise nicht geklappt. Bitte versuchen Sie es erneut.'
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user = User.find(params[:id])
		# @user.destroy
		@user.update_attributes({:inactive => true})
		@productsToInactivate = Product.find(:all, :conditions => {:userId => @user.id})
		@productsToInactivate.each do |product|
			product.inactive = true;
			product.save
		end
		session[:user] = nil

		redirect_to users_url
		flash[:notice] = "Ihr Benutzerkonto wurde deaktiviert."
	end

	def destroy_real
		@user = User.find(params[:id])
		@productsToDestroy = Product.find(:all, :conditions => {:userId => @user.id})
		@productsToDestroy.each do |product|
			product.destroy
		end
		@user.destroy
		session[:user] = nil
		redirect_to users_url
		flash[:notice] = "User zernichtet."
	end
	
	def random_password(size = 10)
		chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
		return (1..size).collect{|a| chars[rand(chars.size)] }.join
	end 
end