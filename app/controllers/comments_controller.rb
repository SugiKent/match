class CommentsController < ApplicationController
include SessionsHelper




   def  create
    binding.pry
    @post = Post.find(params[:post_id])　#コメントをする対象の@postインスタンス変数を作成
    @comment = @post.comments.build(comment_params) #buildを使うことで@postのidをpost_idに含んだ形で@commentを作成
    @comment.user_id = current_user.id #現在のユーザーのidを入れる
    if @comment.save
      redirect_to root_url
    else
      flash[:notice] = "コメントに失敗しました"
      redirect_to root_url
    end
   end


   private
     def comment_params
       params.require(:comment).permit(:user_id, :post_id, :comment)
     end

end
