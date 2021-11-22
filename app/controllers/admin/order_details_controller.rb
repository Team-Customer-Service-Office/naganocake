class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])# production_statusでどれのボタンを押されたか特定する
    @order = order_detail.order# 注文商品から注文テーブルの呼び出し
    @order_detail.update(order_detail_params)# 製作ステータスの更新はproduction_statusのデータ取得が必要

    if @ordered_detail.production_status == "製作中"
       @order.update(status: "製作中")
    elsif @order.order_details.count ==  @order.order_details.where(production_status: "製作終了").count
       @order.update(status: "発送準備中") # 注文ステータスを「発送準備中」に"自動更新"
    end
    redirect_to admin_order_path(@order_detail.order) # 注文詳細に遷移
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
