class CommentsController < ApplicationController


  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @comment
  end

  def create
    @commentable = commentable_type
    @comment = @commentable.comments.create(comment_params)
    redirect_to @commentable
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_name, :author_email, :id)
  end

  def commentable_type
    case
      when !params[:post_id].nil?
        return Post.find(params[:post_id])
      when !params[:video_id].nil?
        return Video.find(params[:video_id])
      when !params[:event_id].nil?
        return Event.find(params[:video_id])
    end
  end
end