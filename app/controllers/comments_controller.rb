class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id), notice: "Succesfully added comment"
    else
      redirect_to "/posts/#{@post.id}", alert: "failed to add comment"
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_post
    @post = Post.find(params['post_id'])
  end
end
