class TopicsController < ApplicationController
  # NHO: can you see a line this is repetitive in this controller?
  # We can help DRY up this controller by using before_action methods to do common tasks such as
  # find a topic
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find params[:id]
    @comment = @topic.comments
  end

  def edit
    @topic = Topic.find params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.create!(topic_params)

    redirect_to topic_path(@topic)
  end

  def update
    @topic = Topic.find params[:id]
    @topic.update(topic_params)

    redirect_to topic_path(@topic)
  end

  def destroy
    @topic = Topic.find params[:id]
    @topic.destroy

    # NHO: this will cause undesired behavior because the topic has already been deleted
    # probably want to redirect_to topics_path
    redirect_to topic_path
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
