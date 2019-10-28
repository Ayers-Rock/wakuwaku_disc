class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path
    end
    # binding.pry
    @orders = @user.orders.limit(3)
    @favorites = @user.favorite_items.limit(5)
    @cart_item = CartItem.new
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
