class CommentsController < ApplicationController
  def create
    if !params[:comment][:parent_id]
      if @comment = Comment.create(comment_params)
        redirect_to "/"
      else
        render 'posts/index'
      end
    else
      @comment = Comment.new(comment_params)
      @comment.parent_id = params[:comment][:parent_id]
      if @comment.save
        redirect_to "/"
      else
        render 'posts/index'
      end
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
