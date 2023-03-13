class AddCommentToCommentLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment_likes, :comment, null: false, foreign_key: true
  end
end
