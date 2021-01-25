class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :check_user, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
  if user_signed_in? && current_user.id == item.user_id
    if item.destroy
       redirect_to root_path
    else
      render :show
    end
  else
    edirect_to root_path
  end

  

  end




  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:title, :image, :text, :price, :category_id, :condition_id, :shipping_id, :prefecture_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

  def check_user
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end


