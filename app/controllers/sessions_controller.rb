class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      if @user.admin?
      flash[:success] = "Successfully logged in as admin"
      redirect_to admin_categories_path
      else
        flash[:success] = "Successfully logged in"
        redirect_to user_path(@user)
      end
    else
      flash[:error] = "Incorrect username or password"
      render :new
    end
  end

  # def destroy
  # end

end
