class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])

    respond_to do |format|
      format.html
      format.pdf do
        # f=''
        # #render :pdf => "report", :template => 'posts/index.pdf.slim', disposition: 'attachment'
        # #File.open(, 'r') { |f| f.readlines }
        # kit = PDFKit.new(render_to_string 'index.pdf.slim'.to_sym, :page_size => 'Letter')
        # kit.stylesheets << 'app/assets/stylesheets/application.css'
        # #pdf = kit.to_pdf
        # file = kit.to_file('test.pdf')
      end
      format.json {render json: @posts}
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
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
