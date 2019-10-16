class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @favolites = Favolite.limit(5).favolite('id')
    @orders = Order.limit(3).order('id')
  end

  def edit
  end

  def update
  end
end
