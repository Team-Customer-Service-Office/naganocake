class Admin::OrdersController < ApplicationController
# before_action :authenticate_admin!

  def index
    @orders = OrderDetail.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find_by(params[:id])
    # @item = @order.order_details
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    # p order_params[:order_status]
    @order.update(order_status: order_params[:order_status].to_i)
    # p @order.order_status
    if @order.order_status == "confirm"

      @order.order_details.each do |order_detail|
       order_detail.update(production_status: 1)
      end
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
