class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

  def index
    if History.exists?(item_id: @item.id) || current_user.id == @item.user.id 
      redirect_to root_path
    end
    @history_order = HistoryOrder.new
  end

  def create
    @history_order = HistoryOrder.new(history_params)
    if @history_order.valid?
      pay_item
      @history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def history_params
    params.require(:history_order).permit(:postal, :state_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy' 
      )
  end
end
