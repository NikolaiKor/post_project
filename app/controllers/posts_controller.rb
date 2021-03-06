# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  image      :string           default("no_image.png")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#
# Indexes
#
#  index_posts_on_id       (id)
#  index_posts_on_tag_ids  (tag_ids)
#

class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @tags = []
    Tag.get_all.each { |tag| @tags << [tag[:name] , tag[:id]]}
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @tags = Tag.get_tags(@post[:tag_ids])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'posts/show'
        kit = PDFKit.new( render_to_string  @post, :page_size => 'Letter', template: 'main_layout', encoding:'utf8')
        pdf = kit.to_pdf
      end
      format.json {render json: @posts}
    end
  end

  def create
    par = post_params
    par[:tag_ids] = params[:post][:tag_ids]
    par[:tag_ids].delete_if{|x| x==""}
    @post = Post.new(par)
    @post.save
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
    params.require(:post).permit(:image, :title, :content, :page)
  end

  def img_path(img)
    "uploads/post/#{img}"
  end
end
