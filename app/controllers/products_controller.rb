class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.find(:all, :conditions => ["inactive != ?", true])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @owningUser = User.find_by_id @product.userId
    @relatedBargainsProposed = Bargain.find(:all, :conditions => {:product1id => @product.id, :status => "1"})
	@relatedBargainsAccepted = Bargain.find(:all, :conditions => {:product2id => @product.id, :status => "1"})
	if @product.views.nil?
		@product.views = 0
	end
	@product.views += 1
	@product.save
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
	@customImages = false
    @relatedBargainsProposed = Bargain.find(:all, :conditions => {:product1id => @product.id, :status => "1"})
	@relatedBargainsAccepted = Bargain.find(:all, :conditions => {:product2id => @product.id, :status => "1"})
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
	@product.inactive = false
	@product.views = 0
	if session[:user].present?
		@product.userId = session[:user].id
	else
		@product.userId = 0
	end
	if @product.save
		redirect_to @product
		flash[:notice] = "Das Produkt wurde erfolgreich erstellt."
	else
		render :new
		flash[:notice] = 'Etwas hat unerwarteterweise nicht geklappt. Bitte versuchen Sie es erneut.'
	end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

	if @product.update_attributes(params[:product])
		redirect_to @product
		flash[:notice] = "Das Produkt wurde erfolgreich aktualisiert."
	else
		render :edit
		flash[:notice] = "Das Produkt existiert nicht (mehr)."
	end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
	@product.inactive = true
	@product.save
    # @product.destroy
	redirect_to products_url
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy_real
    @product = Product.find(params[:id])
    @product.destroy
	redirect_to products_url
  end
end
