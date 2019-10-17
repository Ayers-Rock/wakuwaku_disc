class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def index
    @addresses = Address.all
    # @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:address_id])
  end

  def destroy
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = User.find(params[:user_id])
    if @address.save
      redirect_to address_path(@address.user.id)
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_path(@address.user.id)
    end
  end

  def name
    first_name + last_name
  end

  def power_address
    prefecture + city_address + building
  end

  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :prefecture, :city_address, :building, :postal_code)
  end
end
