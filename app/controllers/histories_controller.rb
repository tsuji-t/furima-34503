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
      Payjp.api_key = "sk_test_9875c4af786d48cf8c7df99f"
      Payjp::Charge.create(
        amount: @item.price,
        card: history_params[:token],
        currency: 'jpy' 
      )
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

end
