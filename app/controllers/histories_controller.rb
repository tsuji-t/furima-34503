class HistoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
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
