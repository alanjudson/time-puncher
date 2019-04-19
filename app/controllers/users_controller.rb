class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_right_user, only: [:new, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @punchtimes = @user.punchtimes.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # signs in after signing up
      session[:user_id] = @user.id
      redirect_to @user, notice: "You can clock your hours now!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "You've updated! Looks good..."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    # logs them out
    session[:user_id] = nil
    redirect_to root_url, alert: "See you soon, but you'll need a new account!"
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_right_user
    puts "\n\n\nSFDJLSDKJFLSKDJFLSKDJF"
    @user = User.find(params[:id])
    Rails.logger.info("Current User #{current_user.name}\n @user: #{@user}")
    unless current_user?(@user)
      redirect_to root_url, alert: "Not your account"
    end
  end
end