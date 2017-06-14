class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect username or password"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
