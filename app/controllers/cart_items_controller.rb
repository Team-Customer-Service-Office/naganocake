class CartItemsController < ApplicationController
  def index
    @items =current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item=CartItem.find_by(params[:id])
    
    
    
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    # if CartItem.find_by(item.id)
    #   CartItem.amount.to_i + Item.amount.to_i
    # else
    # CartItem.new
    # end
  end
  


  def update
    @items =current_customer.cart_items
    if @items.update(cart_item_params)
    redirect_to cart_item_path
    else
      render :index
    end
  end

  def destroy
    @items =current_customer.cart_items
    @items.destroy
    redirect_to cart_item_path
  end

  def all_destroy
    @items =current_customer.cart_items
    @item.destroy_all
    redirect_to cart_items_path
  end
  
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
  end
    
  
 
  
end
