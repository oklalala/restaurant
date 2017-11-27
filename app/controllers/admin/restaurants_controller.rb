class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  
  def index
    @restaurants = Restaurants.all
  end

  def create
    @restaurants = Restaurants.new(restaurants_params)
    if @restaurants.save
      flash[:notice] = "restaurants was successfully created"
      redirect_to admin_restaurant_path
    else
      flash.now[:alart] = "restaurants was failed to create"
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurants).permit(:name, :tel_no, :address, :opening_hours, :description)
  end
end
