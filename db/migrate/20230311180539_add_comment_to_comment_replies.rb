class AddCommentToCommentReplies < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment_replies, :comment, null: false, foreign_key: true
  end
end
