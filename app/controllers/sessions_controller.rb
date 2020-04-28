class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].strip.downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:top] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:top] = "Username or password is incorrect"
      render 'new'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:top] = "You have successfully logged out."
    end
    redirect_to root_path
  end

end