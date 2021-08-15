class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show,:update]
  before_action :set_item, only: [:show,:edit,:update]
  before_action :move_to_index, except:[:show,:index]
  
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
  
  def show
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:title,:text,:category_id,:condition_id,:delivery_fee_id,:prefecture_id,:duration_id,:price).merge(user_id: current_user.id)
  end
 
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user.id
      redirect_to action: :index
    end
  end
  
end
