class OrdersController < ApplicationController

  def new
    @order = Order.new
    @car = Car.find(params[:car_id])
  end

  def create
    @order = Order.new(order_params)
    @car = Car.find(params[:car_id])
    @order.car = @car
    @order.user = current_user
    if @order.save
      redirect_to root_path, notice: "¡Orden creada con éxito! Un agente se pondrá en contacto contigo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:purchase_date, :price)
  end
end
