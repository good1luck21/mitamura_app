class PostsController < ApplicationController
  def index
    @post = Post.new
    @comment = Comment.new
    hello = "こんにちは 普通バージョン" # コントローラーの中でしか使えない
    @hello = "こんにちは@バージョン" # 画面でも使える
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    # @post = Post.find_by(id: 1)
  end

  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    if @post.save
      redirect_to "/"
    else
      render "index"
    end
  end
end
