class CommentsController < ApplicationController

  def contact 
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params) 
    if @comment.save 
      redirect_to :root
    else
      render 'contact'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:name, :email, :content)
  end

end
