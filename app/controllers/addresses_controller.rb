class AddressesController < ApplicationController
  
  def index
    @address = Address.new
    # addresses = Address.find(params[:id])
    
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_user.id
    if @address.save
      flash[:notice]="You have created book successfully."
      redirect_to address_path
    else
      # @addresses = Address.find(params[:id])
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to address_path
  end



private

  def address_params
      params.require(:address).permit(:postcode, :address, :full_name)
  end
  

end