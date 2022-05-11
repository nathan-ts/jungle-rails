class SessionsController < ApplicationController

  def new
  end

  # Login
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login'
    end
  end

  # Logout
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
