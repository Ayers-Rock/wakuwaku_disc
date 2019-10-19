class Admin::UsersController < Admin::AdminApplicationsController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update
      redirect_to admin_user_path(@user.id)
    end
  end

  def orders
  end

  private
def user_params
    params.require(:user).permit(:first_name, :last_name, :first_nana_name, :last_kana_name, :tel_number, :prefecture, :city_address, :building, :postal_code, :email, :password)
end
end

