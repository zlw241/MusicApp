

class SessionsController < ApplicationController
  before_action :ensure_logged_out, only: [:new, :create]


  def destroy
    log_out
    redirect_to new_session_url
  end

  def new
    render :new
  end

  def create
    email = session_params[:email]
    password = session_params[:password]
    user = User.find_by_credentials(email, password)
    if user
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = "wrong username or password"
      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
