class CartItemsController < ApplicationController
  def index
    @items =current_customer.cart_items
    @total = 0
  end

  def create
    if @cart = current_customer.cart_item.find_by(params[:cart_item][:item_id]).nil?
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
    else 
      @cart.quantity +=  params[:cart_item][:quantity].to_i
      @cart.update
    end
    redirect_to cart_items_path
  end
  


  def update
    @items =current_customer.cart_items
    if @items.update(cart_item_params)
    redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @items =current_customer.cart_items.find(params[:id])
    @items.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @items =current_customer.cart_items
    @items.destroy_all
    redirect_to cart_items_path
  end
  
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
  end
    
  
 
  
end
