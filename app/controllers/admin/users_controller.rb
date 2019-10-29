class Admin::UsersController < Admin::AdminApplicationsController
  def index
    # binding.pry
    @users = User.page(params[:page]).per(10).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    # @address = Address.where(address_id: @address_id)
    @addresses = Address.all
    # @orders = current_user.orders
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    end
  end

  def orders
  end

  private
def user_params
    params.require(:user).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :tel_number, :prefecture, :city_address, :building, :postal_code, :email, :password)
end
end

