class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :sold_item, only:[:edit, :update, :destroy]
  
  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index 
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to action: :index
  end

  private
  def sold_item
    if History.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
  
  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_id, :state_id, :arrival_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
  
end

