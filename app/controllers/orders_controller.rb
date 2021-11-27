class OrdersController < ApplicationController
  
  
  def index
    @order = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    
    if params[:order][:select_address] == "0" 
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address 
      @order.full_name = current_customer.first_name+current_customer.last_name

    elsif  params[:order][:select_addres] == "1"
      @addresses = Address.find(params[:order][:address_id])
      @order.postcode = @addresses.postcode
      @order.address = @addresses.address
      @order.full_name = @addresses.full_name
    
    else params[:order][:select_address] == '2'
    end
        
    @item = current_customer.cart_items
    @total = 0
  end
  
  
  def create 
    @orders=Order.new(confirm_params)
    @orders.save
    
    current_customer.cart_items.each do |item|
      @item = OrderDetail.new
      @item.item_id = item.item_id
      @item.quantity = item.quantity
      @item.price = item.item.price_without_tax
      @item.order_id = @orders.id
      @item.production_status = '着手不可'
      @item.save
    end
    
    current_customer.cart_items.destroy_all
    
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :full_name)
  end
  

  def confirm_params
    params.permit(:customer_id, :postcode, :address, :full_name, :postage, :total_payment, :payment_method, :order_status)
  end
  
end
