class Admin::UsersController < Admin::AdminApplicationsController
  def index
    unless params[:search].blank?
      u_first = User.where("first_name LIKE ?", "%#{params[:search]}%")
      u_last = User.where("last_name LIKE ?", "%#{params[:search]}%")
      u_k_first = User.where("first_kana_name LIKE ?", "%#{params[:search]}%")
      u_k_last = User.where("last_kana_name LIKE ?", "%#{params[:search]}%")
      email = User.where("email LIKE ?", "%#{params[:search]}%")
      a = u_first | u_last
      b = ( a | email )
      c = ( b | u_k_first )
      d = ( c | u_k_last )
      @users = Kaminari.paginate_array(d).page(params[:page]).per(PER)
    else
      @users = User.page(params[:page]).per(10).reverse_order
    end
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

