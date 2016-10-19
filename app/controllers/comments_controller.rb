class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.find params[:topic_id]
    @comment
  end

  def edit
    @topic = Topic.find params[:topic_id]
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @post.edit
    else
      flash[:alert] = "Only the author of the comment can edit"
    end
    redirect_to topics_path
  end

  def update
    @topic = Topic.find params[:topic_id]
    @comment = Comment.find params [:id]
    @comment.update(comment_params)
  end

  def create
  @topic = Topic.find params[:topic_id]
  @comment = Comment.create!(comment_params.merge(user: current_user))
  redirect_to topic_path(@comment)
  end

  def destroy
    @topic = Topic.find params [:topic_id]
    @comment = comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    else
      flash[:alert] = "Only the author of the comment can delete"
    end
    redirect_to comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
