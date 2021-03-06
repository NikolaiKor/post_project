# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  video       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_ids     :integer          default([]), is an Array
#
# Indexes
#
#  index_videos_on_id       (id)
#  index_videos_on_tag_ids  (tag_ids)
#

class VideosController < ApplicationController
  def index
    @videos = Video.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @videos }
    end
  end

  def new
    @tags = []
    Tag.get_all.each { |tag| @tags << [tag[:name] , tag[:id]]}
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
    @tags = Tag.get_tags(@video[:tag_ids])
  end

  def create
    par = video_params
    par[:tag_ids] = params[:event][:tag_ids]
    par[:tag_ids].delete_if{|x| x==""}
    @video = Video.new(par)
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
