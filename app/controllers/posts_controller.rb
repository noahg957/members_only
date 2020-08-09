class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(created_at: :desc)
    if user_signed_in?
      @post = current_user.posts.build
    else
      @post = Post.new
    end
  end

  # GET /posts/1
  # GET /posts/1.json


  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit


  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json


  # DELETE /posts/1
  # DELETE /posts/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body)
    end
end
