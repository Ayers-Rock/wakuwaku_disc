class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@favolites = Favolite.limit(5).favolite('id')
    @orders = Order.limit(3).order('id')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "you have updated user successfully."
    end
  end
end
