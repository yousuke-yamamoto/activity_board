class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.activity
    else
      redirect_back(fallback_location: root_path)
      flash[:error_messages] = comment.errors.full_messages
    end
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @comment = @activity.comments.find(params[:id])
    @comment.destroy    
    redirect_to activity_path(@activity), flash:{ notice: 'コメントが削除されました'}
  end
  
  private
  def comment_params
    params.require(:comment).permit(:activity_id, :name, :comment)
  end
  
end
