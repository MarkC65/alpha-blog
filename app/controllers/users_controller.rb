class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 10)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(params_require)
    if @user.id
      flash[:top] = "Welcome #{ @user.display_name }, you have successfully signed up."
      @current_user = @user
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(params_require2)
      flash[:top] = "#{ @user.display_name } profile successfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

private
  def params_require
    params.require(:user).permit(:username, :display_name, :email, :password)
  end

  def params_require2
    params.require(:user).permit(:display_name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end