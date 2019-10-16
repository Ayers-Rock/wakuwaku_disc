class Admin::UsersController < Admin::AdminApplicationsController
  def index
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def orders
  end
end

