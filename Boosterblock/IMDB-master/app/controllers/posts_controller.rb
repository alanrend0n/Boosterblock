class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # HTTP GET /posts or /posts.json
  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json { render json: search_posts }
    end
  end

  # HTTP GET /posts/1
  def show
  end

  # HTTP GET /posts/new
  def new
    @post = Post.new
  end

  # HTTP GET /posts/1/edit
  def edit
  end

  # HTTP POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # HTTP PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # HTTP DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def search_posts
      return search_posts_by_title if params[:type] == "title"

      search_posts_by_genre
    end

    def search_posts_by_title
      Post.where(title: /#{params[:query]}/i).only(:id).map{ |p| p.id.to_s }
    end

  def search_posts_by_genre
    Post.where(genre: /#{params[:query]}/i).only(:id).map{ |p| p.id.to_s }
  end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :detail, :genre, :duration)
    end
end
