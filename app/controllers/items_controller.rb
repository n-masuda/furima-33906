class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show]
  def index
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

  private
  def move_to_index
     unless user_signed_in?
      redirect_to action: :index
     end
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :price, :shipment_id, :image).merge(user_id: current_user.id)
  end

end
