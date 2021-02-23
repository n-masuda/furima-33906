class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  #before_action :own_user
  def index
    @form = Form.new
  end

  def create

    @form = Form.new(form_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def form_params
    params.require(:form).permit(:postal_code, :city, :add_line1, :add_line2, :phone, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def own_user!
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
