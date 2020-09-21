class OrdersController < ApplicationController
  
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.orders.new(order_params)
    if @order.save
      redirect_to item_path(@item)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,).merge(users_id: current_user.id, item_id: params[:item_id])
  end
end
