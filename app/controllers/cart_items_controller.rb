class CartItemsController < ApplicationController
  def index
    @item = CartItem.find(cart_item_params[:item_id])
    
    
  end

  def create
    @item = CartItem.find(cart_item_params[:item_id])
    if CartItem.find_by(item.id)
      CartItem.amount.to_i + Item.amount.to_i
    else
    CartItem.new
    end
  end
  


  def update
  end

  def destroy
  end

  def all_destroy
  end
  
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
    
  
  def with_tax_price
    (price_without_tax * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end
  
  
end
