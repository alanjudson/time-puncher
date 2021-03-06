class SessionsController < ApplicationController
  def new

  end
  def create
    # authenticate - match user namem/password
    if user = User.is_authentic(params[:email], params[:password])
      # get a session hash with user id
      session[:user_id] = user.id
      flash[:notice] = "Hi there, #{user.name}!"
      # goes to last url or user profile
      redirect_to(user)
      # gets rid of stale intended url
      session[:last_url] = nil
    else
      flash.now[:alert] = "Wrong password, try again."
      render :new
      # redirect
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're signed out now!"
  end
end
