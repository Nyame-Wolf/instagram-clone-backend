class AddUserToStories < ActiveRecord::Migration[7.0]
  def change
    add_reference :stories, :user, null: false, foreign_key: true
  end
end
