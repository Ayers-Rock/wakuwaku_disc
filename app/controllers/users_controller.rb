class UsersController < ApplicationController
  def show
    @users = User.all
    @user = User.find(params[:id])
    @favorites = Favorite.all
    # @favorites = Favorite.limit(5).favorite('id')
    @orders = Order.limit(3).order('id')
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
