class UsersController < ApplicationController
include SessionsHelper

  def index
        @search = User.ransack(params[:q])
        @users = @search.result

  end

  def show
        @user = User.find_by(id: params[:id])

  end

  def new
        @user = User.new
  end

  def create
        @user = User.new(user_params)

        if @user.save
           log_in @user
           flash[:notice] = "登録に成功しました"
           redirect_to root_url
        else
           flash[:notice] = "登録に失敗しました"
           render "new"
        end
  end

  def edit
        @user = User.find_by(id: params[:id])
  end

  def update
        @user = User.find_by(id: params[:id])
        if @user.update_attributes(user_params)
           flash[:notice] = "更新に成功しました"
           redirect_to root_url
        else
            render "edit"
        end
  end

  def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        flash[:notice] = "削除に成功しました"
        redirect_to root_url
  end


  private

  def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :sex, :introduce, :image, :howmuch)
  end
end
