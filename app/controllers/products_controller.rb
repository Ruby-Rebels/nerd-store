class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount] == "true"
      @products = Product.where("price < ?", 500)
    end
  end

  def new
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
      )

    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
      )

    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Product Created"
    redirect_to "/"
  end

  def search
    @products = Product.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    render "index.html.erb"
  end
end
