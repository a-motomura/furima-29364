class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end