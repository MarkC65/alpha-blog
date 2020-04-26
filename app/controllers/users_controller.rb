class UsersController < ApplicationController

  def show
  end

  def index
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(params_require)
    if @user.id
      flash[:top] = "User created successfully."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

private
  def params_require
    params.require(:user).permit(:username, :display_name, :email, :password)
  end
end