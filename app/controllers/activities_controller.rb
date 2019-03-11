class ActivitiesController < ApplicationController
  before_action :set_target_activity, only: %i[show edit update destroy]
  
  def index
    @activities = Activity.page(params[:page])
  end

  def new
    @activity = Activity.new
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to root_path, notice:"「#{@activity.title}」が投稿されました！"
    else
      flash[:error_messages] = @activity.errors.full_messages
      render:new
    end
  end
  
  def update
    if @activity.update(activity_params)
      redirect_to activity_path, notice:"「#{@activity.title}」が修正されました！"
    else
      flash[:error_messages] = @activity.errors.full_messages
      render:edit
    end
  end
  
  
  def destroy
    @activity.destroy
    redirect_to root_path, notice:"「#{@activity.title}」が削除されました！"
  end
  
  private
  def activity_params
    params.require(:activity).permit(:branch_name, :title, :content, :img)
  end
  
  def set_target_activity
    @activity = Activity.find(params[:id])
  end
end
