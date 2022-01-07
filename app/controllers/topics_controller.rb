class TopicsController < ApplicationController
  def index
    @topics = Topic.all.limit(10)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(request_params)
    if @topic.save
      redirect_to topics_path
    else
      render 'topics/new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(request_params)
      redirect_to topic_path(@topic)
    else
      render 'topics/edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private

  def request_params
    params.require(:topic).permit(:name)
  end
end
