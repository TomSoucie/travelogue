class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in"
      redirect_to user_path(@user)
    else
      render :new
    end
  end
end
