class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :own_user!
  before_action :item_sold, only: [:index, :create]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      return render :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :city, :add_line1, :add_line2, :phone, :prefecture_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def own_user!
    redirect_to root_path if current_user.id == @item.user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def item_sold
    @item_sold = Order.pluck(:item_id)
    redirect_to root_path if @item_sold.include?(@item.id)
  end

  
end
