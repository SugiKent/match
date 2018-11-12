class HomeController < ApplicationController

  def top
      @posts = Post.page(params[:page]).per(7)
  end

  def about

  end
end
