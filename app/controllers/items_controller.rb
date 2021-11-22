class ItemsController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @categories = Category.all
    @item = Item.find(params[:id])
  end
end
