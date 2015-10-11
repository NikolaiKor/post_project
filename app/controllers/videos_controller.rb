class VideosController < ApplicationController
  def index
    @videos = Video.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @videos }
    end
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    @video.save!
    redirect_to @video
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      redirect_to @video
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to videos_path
  end

  private
  def video_params
    params.require(:video).permit(:video, :title, :description)
  end
end
