

class UsersController < ApplicationController
  before_action :ensure_logged_in, only: [:users, :index, :destroy]


  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render users_url
    end
  end

  def destroy
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
