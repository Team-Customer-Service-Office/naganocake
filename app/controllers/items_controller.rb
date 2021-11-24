class ItemsController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id].nil?
      @items = Item.where(is_active: true).page(params[:page]).per(8)
    else
      @category = Category.find( params[:category_id])
      @items = @category.items.where(is_active: true).page(params[:page]).per(8)
    end
  end

  def show
    @categories = Category.all
    @item = Item.find(params[:id])
    binding.pry
    @cart_item = CartItem.new
  end
  
  
 
  
end
