class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update]

  def new
    # binding.pry
    @address = Address.new(user_id: params[:user_id])

  end

  def index
    @user = User.find(params[:user_id])
    @addresses = @user.addresses.all
    # @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:address_id])
  end

  def destroy
    @address = Address.find(params[:id])
    # binding.pry
    @address.destroy
    redirect_to user_addresses_path(@address.user.id)
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to user_addresses_path(@address.user.id)
    else
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id]) #編集へ
  end

  def update
    # binding.pry
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(@address.user.id)
      else
        render :edit
    end
  end


  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :prefecture, :city_address, :building, :postal_code)
  end
end
