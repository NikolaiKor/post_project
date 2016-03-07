class TagsController < ApplicationController
  def index
    @tags = Tag.get_all
  end

  def show
    @tag = Tag.find(params[:id])
    @content = ContentView.any_tags(params[:id])
  end

  private
  def tag_params
    params.require(:tag).permit(:id)
  end
end
