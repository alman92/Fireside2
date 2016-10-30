class CommentsController < ApplicationController
  # NHO: can you see a line this is repetitive in this controller?
  # We can help DRY up this controller by using before_action methods to do common tasks such as
  # find a topic

  # NHO: this method is not consistent with the route,
  # I dont think this is being used 
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
    # NHO: @comment = Comment.find(params[:id]) ?
    @comment = Comment.where(topic: @topic.id)[0] # NHO: is this always the first? Can a user have more than one comment?
    @comment.update(comment_params)
    if @comment.user == current_user # NHO: Nice auth!
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
