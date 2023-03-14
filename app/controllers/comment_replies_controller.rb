class CommentRepliesController < ApplicationController
  before_action :set_comment_reply, only: %i[show update destroy]

  # GET /comment_replies
  def index
    @comment_replies = CommentReply.all

    render json: @comment_replies
  end

  # GET /comment_replies/1
  def show
    render json: @comment_reply
  end

  # POST /comment_replies
  def create
    @comment_reply = CommentReply.new(comment_reply_params)

    if @comment_reply.save
      render json: @comment_reply, status: :created, location: @comment_reply
    else
      render json: @comment_reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comment_replies/1
  def update
    if @comment_reply.update(comment_reply_params)
      render json: @comment_reply
    else
      render json: @comment_reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comment_replies/1
  def destroy
    @comment_reply.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment_reply
    @comment_reply = CommentReply.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_reply_params
    params.require(:comment_reply).permit(:text, :user_id, :comment_id)
  end
end
