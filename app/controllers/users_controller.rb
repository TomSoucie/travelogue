class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.create!(user_params)
    flash[:success] = "Successfully Logged In!"
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
