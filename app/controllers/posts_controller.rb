class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = Post.includes(:user, :comments, :likes, :favorites)
    render json: @posts, includes: %i[desc created_at], methods: %i[image_urls post_user post_comments post_likes], except: %i[user_id updated_at]
  end

  # GET /posts/1
  def show
    render json: @post, includes: %i[desc created_at], methods: %i[image_urls post_user post_comments post_likes], except: %i[user_id updated_at]
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.includes(:user, :comments, :likes).find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def post_params
    params.require(:post).permit(:user_id, :title, images: []) # permits the "user_id" symbol parameter, "text" symbol parameter, and the "images" array parameter
  end
end
