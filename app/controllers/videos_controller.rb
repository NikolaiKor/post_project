class VideosController < ApplicationController
  def index
    @video = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new(params[:article])
    @video.save
    redirect_to @video
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      redirect_to @video
    else
      render 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to videos_path
  end

  private
  def video_params
    params.require(:video).permit(:title, :text)
  end
end
