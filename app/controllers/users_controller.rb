class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def discover
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    # user = User.find_by(email: params[:email])
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
      flash[:notice] = "Welcome #{user.name}"
    else
      flash[:error] = user.errors.full_messages
      redirect_to register_path
    end
  end

  def login; end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Credentials invalid'
      redirect_to login_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
