class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, {only: [:show, :edit]}

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to customer_path(@customer)
    else
       render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def out
    @customer = current_customer
    if @customer.update(is_deleted: true)
       #URLを踏ませずにコントローラーから直接サインアウトの指示を出す
       sign_out current_customer
    end
       redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,:phone_number, :email, :password, :postcode, :address)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    if current_customer.id != @customer.id
      redirect_to root_path
    end
  end

end
