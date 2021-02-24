class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action :index
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :delivery_fee_id, :state_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  
end

