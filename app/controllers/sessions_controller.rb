class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:notice] = "ログインしました"
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "メールアドレスもしくはパスワードが間違っています"
      render "new"
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
