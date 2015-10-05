class CommentsController < ApplicationController


  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(params[:article])
    @comment.save
    redirect_to @comment
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
    params.require(:comment).permit(:author_name, :content, :target_type, :target_id)
  end
end

