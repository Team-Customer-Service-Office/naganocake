class OrdersController < ApplicationController
  
  def index
  end

  def show
    
  end

  def new
    @order = Order.new
  end
  
  def create
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    
    if params[:order][:address] == "0" 
      @order.postcode = current_customer.postalcode
      @order.address = current_cusutomer.address 
      @order.name = current_customer.first_name+current_customer.last_name

    elsif  params[:order][:addres] ==  "1"
      @order.postcode = Address.find(params[:order][:address]).postcode
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).full_name

    elsif params[:order][:address] ==  "2" 
      @address = Address.new()
      @address.address = params[:order][:address]
      @address.name = params[:order][:full_name]
      @address.postcode = params[:order][:postcode]
      @address.customer_id = current_customer.id
        if @address.save
        @order.postcode = @address.postcode
        @order.full_name = @address.full_name
        @order.address = @address.addresss
        else
         render 'new'
        end
    end
   end

  def confirm
  end

  

  def complete
  end
  
  
  private
  def order_params
    params.require(:order).permit(:postcode, :address, :full_name)
  end
  
end
