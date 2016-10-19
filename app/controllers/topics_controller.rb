class TopicsController < ApplicationController
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

    redirect_to topic_path
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
