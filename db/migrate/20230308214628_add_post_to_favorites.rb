class AddPostToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :post, null: false, foreign_key: true
  end
end
