class OrdersController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to user_session_path
      return
    end

    if Item.find(params[:item_id]).user.id == current_user.id
      redirect_to root_path
    end
    @user_order = UserOrder.new  
  end

  def new
  end

  def create
    @user_order = UserOrder.new(order_params)   
     if @user_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price, 
        card: order_params[:token],    
        currency: 'jpy'                 
      )
       @user_order.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def order_params
   params.require(:user_order).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
