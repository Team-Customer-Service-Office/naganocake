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
  end

  def unsubscribe
  end

  def out
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
