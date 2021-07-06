class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: sessions_params[:email])
    if user&.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました'
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end

