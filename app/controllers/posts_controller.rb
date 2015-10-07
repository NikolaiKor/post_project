class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post
  end

  def create
    @post = Post.new(post_params)
    @post.save!
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :content)
  end

  def img_path(img)
    "uploads/post/#{img}"
  end
end
