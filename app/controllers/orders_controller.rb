class OrdersController < ApplicationController
  
  def index
  end

  def show
    
  end

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.save
  end

  def confirm
  end

  

  def complete
  end
  
  
end
