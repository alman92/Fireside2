class CommentsController < ApplicationController
  def index
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @post.edit
    else
      flash[:alert] = "Only the author of the comment can edit"
    end
    redirect_to comments_path
  end

  def create
  @comment = Comment.create!(comment_params.merge(user: current_user))
  redirect_to comment_path(@comment)
  end

  def destroy
    @comment = comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    else
      flash[:alert] = "Only the author of the comment can delete"
    end
    redirect_to comments_path
  end

end
