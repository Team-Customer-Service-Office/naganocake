# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # Admin側のログイン・ログアウト後の遷移先
  protected
    def after_sign_in_path_for(resource)
      # 注文履歴一覧ページ作成後、admin_orders_pathを追加
      root_path
    end
    
    def after_sign_out_path_for(resource)
      new_admin_session_path
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
