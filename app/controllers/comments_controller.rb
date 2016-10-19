class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @topic = Topic.find params[:topic_id]
    @comment = Comment.find params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:comment][:topic_id])
    @comment = @topic.comments.create(comment_params.merge(user: current_user))
    redirect_to topic_path(@topic)
 end

  def edit
    @topic = Topic.find params[:topic_id]
    @comment = Comment.find params[:id]
  end

  def update
    @topic = Topic.find params[:topic_id]
    @comment = Comment.where(topic: @topic.id)[0]
    @comment.update(comment_params)
    if @comment.user == current_user
      @comment.update(comment_params)
    else
      flash[:alert] = "Only the author of the comment can edit"
    end
    redirect_to topic_comment_path(@topic, @comment)
  end

  def destroy
    @topic = Topic.find params[:topic_id]
    @comment = Comment.find params[:id]
    # @comment = Comment.where(topic: @topic.id)[0]
    if @comment == nil
      redirect_to @topic and return
    else
      if @comment.user == current_user
        @comment.destroy
      else
        flash[:alert] = "Only the author of the comment can delete"
      end
    end
    redirect_to topic_path(@topic)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :topic)
  end

end
