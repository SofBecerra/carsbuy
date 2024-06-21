class PagesController < ApplicationController

  def home
    @cars = Car.where(available: true)
  end

  def my_orders
    @orders = current_user.orders
  end
end
