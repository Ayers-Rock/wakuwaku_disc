class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # binding.pry
    @orders = @user.orders.all
    @favorites = @user.favorite_items.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postal_code, :prefecture, :city_address, :building, :tel_number, :email)
    end
    
end
