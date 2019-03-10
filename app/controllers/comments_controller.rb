class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.activity
    else
      reirect_to :back, flash:{
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
  end

  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:activity_id, :name, :comment)
  end
  
end
