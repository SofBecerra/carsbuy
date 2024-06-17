class CarsController < ApplicationController
  # We need @restaurant in our `simple_form_for`

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(params[:car]) # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to car_path(@order.car), status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def car_params
    params.require(:car).permit(:brand, :color, :information, :price, :year, :user_id)
  end
end
