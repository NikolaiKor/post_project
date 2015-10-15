class WelcomeController < ApplicationController
  def index
    @posts = Post.last(3) #find only last created posts, but not last changed
    @events = Event.last(3)
    @videos = Video.last(3)
    @tags_cloud = Tag.cloud
  end
end
