class CommentsController < ApplicationController
include SessionsHelper
include PostsHelper

  def index
      @comments = @post.comments.includes(:user)
  end




   def  create
    @post = Post.find(params[:post_id]) #コメントをする対象の@postインスタンス変数を作成
    @comment = @post.comments.build(comment_params) #buildを使うことで@postのidをpost_idに含んだ形で@commentを作成
    @comment.user_id = current_user.id #現在のユーザーのidを入れる
    if @comment.save
      respond_to do |format|
        format.html{redirect_to root_url}
        format.js
      end
    else
      flash[:notice] = "コメントに失敗しました"
      redirect_to root_url
    end
   end

   def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     redirect_to root_url
   end


   private
     def comment_params
       params.required(:comment).permit(:user_id, :post_id, :comment)
     end

end
