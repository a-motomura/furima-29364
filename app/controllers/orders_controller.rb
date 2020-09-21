class OrdersController < ApplicationController
  
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to item_path(@item)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,).merge(users_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Carge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
