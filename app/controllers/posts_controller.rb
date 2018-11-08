class PostsController < ApplicationController
  include SessionsHelper
  before_action :correct_user, only: :destroy


  def new
    if current_user
      @post = current_user.posts.build #ログインしたら投稿ができる
    else
      redirect_to new_post_path
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new #postコントローラーのshow.html.erbでコメントの入力フォームで使用するためにインスタンス変数、@commentを記述
    @comments = @post.comments.includes(:user) #postコントローラーのshow.html.erbでコメントを表示するためにインスタンス変数、@commentsを記述
  end

  def destroy
    @post.destroy
    flash[:notice] = "削除に成功しました"
    redirect_to root_url
  end

  private
    def post_params
      params.require(:post).permit(:content, :picture,)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
