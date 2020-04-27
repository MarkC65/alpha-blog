class UsersController < ApplicationController

  def show
  end

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(params_require)
    if @user.id
      flash[:top] = "Welcome #{ @user.display_name }, you have successfully signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_require)
      flash[:top] = "Profile updated successfully."
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private
  def params_require
    params.require(:user).permit(:username, :display_name, :email, :password)
  end
end