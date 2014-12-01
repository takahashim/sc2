class SessionsController < ApplicationController
  def create
    user = User.create_from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました"
  end
end
