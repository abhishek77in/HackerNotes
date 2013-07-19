class UsersController < ApplicationController

  def show
    @user = User.where(nickname: params[:username]).first
  end
end
