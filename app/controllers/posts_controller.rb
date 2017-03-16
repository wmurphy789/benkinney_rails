class PostsController < ApplicationController
  before_action :set_posts, only: [:index, :new]
  before_action :set_post, only: [:show]
  before_action :set_post_for_comment, only: [:create_comment]
  before_action :set_user, only: [:new, :create, :create_comment]
  before_filter :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def show
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create(post_params)
    set_posts
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create_comment
    @comment = Comment.new
  end

  private
    def set_post_for_comment
      @post = Post.find(params[:post_id])
    end

    def set_post
      @post = Post.find(params[:id])
      @comments = Comment.where(post_id: params[:id]).paginate(:page => params[:page], :per_page => 10)
    end

    def set_posts
      @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {}).permit(:title, :body, :user_id)
    end
end
