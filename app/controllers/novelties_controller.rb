class NoveltiesController < ApplicationController
  def index
    @novelties = Novelty.all
  end

  def new
  end

  def create
    @novelty = Novelty.create(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
      )

    flash[:success] = "Novelty Created"
    redirect_to "/novelties/#{@novelty.id}"
  end

  def show
    @novelty = Novelty.find_by(id: params[:id])
  end

  def edit
    @novelty = Novelty.find_by(id: params[:id])
  end

  def update
    @novelty = Novelty.find_by(id: params[:id])
    @novelty.update(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      price: params[:price]
      )

    flash[:success] = "Novelty Updated"
    redirect_to "/novelties/#{@novelty.id}"
  end

  def destroy
    @novelty = Novelty.find_by(id: params[:id])
    @novelty.destroy

    flash[:warning] = "Novelty Created"
    redirect_to "/"
  end
end

