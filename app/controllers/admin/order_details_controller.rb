class Admin::OrderDetailsController < ApplicationController
# before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])# production_statusでどれのボタンを押されたか特定する
    @order = @order_detail.order# 注文商品から注文テーブルの呼び出し
    @order_detail.update(production_status: order_detail_params[:production_status].to_i)# 製作ステータスの更新はproduction_statusだけのデータ取得が必要。to_iではいってくるデータをintegerにする
    p @order_detail
    if @order_detail.production_status == "製作中"
       @order.update(order_status: 2)
    elsif @order.order_details.count ==  @order.order_details.where(production_status: 3).count
       @order.update(order_status: 3) # 注文ステータスを「発送準備中」に"自動更新"
    end
    redirect_to admin_order_path(@order_detail.order) # 注文詳細に遷移
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
