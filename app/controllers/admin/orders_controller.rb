class Admin::OrdersController < ApplicationController
  def index
    @orders = OrderDetail.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find_by(params[:id])
    @item = @order.order_details
  end

  def update
    
  end
end
