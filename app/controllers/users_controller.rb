class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user: @user).all
  end
end
