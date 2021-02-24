class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :own_user, only: [:edit, :update, :destroy]
  before_action :item_sold, only: [:index, :show, :edit]
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
    if @item_sold.include?(@item.id)
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
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :price, :shipment_id, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def own_user
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def item_sold
    @item_sold = Order.pluck(:item_id)
  end
end
