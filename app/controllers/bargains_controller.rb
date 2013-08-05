class BargainsController < ApplicationController
	# GET /bargains
	# GET /bargains.json
	def index
		@bargains = Bargain.find(:all, :conditions => {:status => 1})
	end

	# GET /bargains/1
	def show
		@bargain = Bargain.find(params[:id])
	end

	# GET /bargains/new
	def new
		if session[:user].nil?			
			redirect_to bargains_url
			flash[:notice] = 'Sie sind nicht eingeloggt.'
		else
			@bargain = Bargain.new
			@myProducts = Product.find(:all, :conditions => ["userId = ? AND inactive != ?", session[:user].id, true])
			@otherProducts = Product.find(:all, :conditions => ["userId != ? AND inactive != ?", session[:user].id, true])
		end
	end

	# GET /bargains/1/edit
	def edit
		@bargain = Bargain.find(params[:id])
		if session[:user].nil? || (session[:user].id != @bargain.userId1 && session[:user].id != @bargain.userId2)
			redirect_to bargains_url
			flash[:notice] = 'Sie sind nicht als ein beteiligter Tauschpartner eingeloggt.'
		else
			@bargain = Bargain.find(params[:id])
			@myProducts = Product.find(:all, :conditions => ["userId = ? AND inactive != ?", session[:user].id, true])
			@otherProducts = Product.find(:all, :conditions => ["userId != ? AND inactive != ?", session[:user].id, true])
		end
	end

	# POST /bargains
	def create
		@myProducts = Product.find(:all, :conditions => ["userId = ? AND inactive != ?", session[:user].id, true]) # needed for validation redirect
		@otherProducts = Product.find(:all, :conditions => ["userId != ? AND inactive != ?", session[:user].id, true]) # needed for validation redirect
		@bargain = Bargain.new(params[:bargain])
		sendingUserProduct = @bargain.product1
		receivingUserProduct = @bargain.product2
		@bargain.userId1 = @bargain.product1.userId
		@bargain.userId2 = @bargain.product2.userId
		@bargain.status = 0
		@bargain.proposingUser = session[:user].id
		if @bargain.save
			Emailer.sendProposedBargain(User.find_by_id(@bargain.userId2), session[:user], @bargain, sendingUserProduct, receivingUserProduct).deliver
			redirect_to @bargain
			flash[:notice] = 'Der Tausch wurde erstellt und wird jetzt Ihrem Tauschpartner ' + session[:user].name + ' vorgeschlagen.'
		else
			render :new
		end
	end

  # PUT /bargains/1
  def update
    @bargain = Bargain.find(params[:id])
	if params["repropose"]
		@bargain = Bargain.find(params[:id])
		if @bargain.update_attributes(params[:bargain])
			if (@bargain.userId1 == session[:user].id)
				sender = @bargain.owningUser1
				recipient = @bargain.owningUser2
				sendingUserProduct = @bargain.product1
				receivingUserProduct = @bargain.product2
			else
				sender = @bargain.owningUser2
				recipient = @bargain.owningUser1
				sendingUserProduct = @bargain.product2
				receivingUserProduct = @bargain.product1
			end
			Emailer.reproposeBargain(recipient, sender, sendingUserProduct, receivingUserProduct).deliver
			redirect_to @bargain
			flash[:notice] = 'Der Tausch wurde modifiziert und Ihr Tauschpartner wurde benachrichtigt.'
		else
			redirect_to @bargain
			flash[:notice] = 'Etwas hat unerwarteterweise nicht geklappt. Bitte versuchen Sie es erneut.'
		end
		
	elsif params["accept"]
		@bargain = Bargain.find(params[:id])
		@bargain.update_attributes({:status => 1})
		@bargain.save
		if (@bargain.userId1 == session[:user].id)
			sender = @bargain.owningUser1
			recipient = @bargain.owningUser2
			sendingUserProduct = @bargain.product1
			receivingUserProduct = @bargain.product2
		else
			sender = @bargain.owningUser2
			recipient = @bargain.owningUser1
			sendingUserProduct = @bargain.product2
			receivingUserProduct = @bargain.product1
		end
		Emailer.acceptBargain(recipient, sender, sendingUserProduct, receivingUserProduct).deliver
		Emailer.acceptBargainToAcceptant(sender, recipient, receivingUserProduct, sendingUserProduct).deliver
		redirect_to @bargain
		flash[:notice] = 'Der Tausch wurde akzeptiert und Ihr Tauschpartner wurde benachrichtigt. Eine E-Mail mit weiteren Informationen wurde an Sie verschickt.'
		
	elsif params["deny"]
		@bargain = Bargain.find(params[:id])
		@bargain.update_attributes({:status => -1})
		@bargain.save
		if (@bargain.userId1 == session[:user].id)
			sender = @bargain.owningUser1
			recipient = @bargain.owningUser2
			sendingUserProduct = @bargain.product1
			receivingUserProduct = @bargain.product2
		else
			sender = @bargain.owningUser2
			recipient = @bargain.owningUser1
			sendingUserProduct = @bargain.product2
			receivingUserProduct = @bargain.product1
		end
		Emailer.denyBargain(recipient, sender, @bargain, sendingUserProduct, receivingUserProduct).deliver
		redirect_to bargains_url
		flash[:notice] = 'Der Tausch wurde abgelehnt und Ihr Tauschpartner wurde benachrichtigt.'
	else	
		if @bargain.update_attributes(params[:bargain])
			(1..10).each do |i|
				if params[:bargain]["delete_photo" + i.to_s] == "1"
					photo = @bargain.send("photo" + i.to_s)
					photo.destroy
					@bargain.save
				end
			end
			redirect_to @bargain
			flash[:notice] = 'Der Tausch wurde aktualisiert.'
		else
			render :edit
		end
	end
  end

  # DELETE /bargains/1
  def destroy
    @bargain = Bargain.find(params[:id])
    @bargain.destroy
	redirect_to bargains_url
  end
end
