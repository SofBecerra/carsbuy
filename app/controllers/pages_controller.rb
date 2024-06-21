class PagesController < ApplicationController

  def home
    @cars = Car.where(available: true)
  end

  def my_orders
    @orders = current_user.orders
  end

  def my_cars
    @cars = current_user.cars
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to my_cars_path, status: :see_other, notice: 'Auto eliminado'
  end
end
