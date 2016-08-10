class ProductsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show, :search]

  def index
    @products = Product.all
    if params[:blah] && params[:blah_blah]
      @products = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount] == "true"
      @products = Product.where("price < ?", 500)
    end
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
  end

  def new
    @product = Product.new
    render "new.html.erb"
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    if @product.valid?
      flash[:success] = "Product Created"
      redirect_to "/products/#{@product.id}"
    else
      flash[:danger] = @product.errors.full_messages
      render "new.html.erb"
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    @supplier = @product.supplier
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )

    if @product.valid?
      flash[:success] = "Product Updated"
      redirect_to "/products/#{@product.id}"
    else
      flash[:danger] = @product.errors.full_messages
      #flash = {danger: ["Name can't be blank", "Description can't be blank"]}
      render "edit"
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end

  def search
    @products = Product.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    render "index.html.erb"
  end
end
