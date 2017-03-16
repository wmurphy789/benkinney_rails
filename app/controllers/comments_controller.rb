class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # POST /posts
  # POST /posts.json
  def create
    @comment = Comment.create(comment_params)
    set_comment
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
    def set_comment
      @post = Post.find(@comment.post_id) if @comment.post_id
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment, {}).permit(:body, :user_id, :post_id)
    end
end
