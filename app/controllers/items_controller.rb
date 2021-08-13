class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.order("created_at DESC")
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

  def item_params
    params.require(:item).permit(:image,:title,:text,:category_id,:condition_id,:delivery_fee_id,:prefecture_id,:duration_id,:price).merge(user_id: current_user.id)
  end

end
