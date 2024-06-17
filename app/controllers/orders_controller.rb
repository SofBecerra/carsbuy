class OrdersController < ApplicationController

  def new
    @order = Order.find(params[:car_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to order_path(@car)
  end

  private

  def order_params
    params.require(:order).permit(:content)
  end
end
