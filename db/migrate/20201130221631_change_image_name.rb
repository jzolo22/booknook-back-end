class ChangeImageName < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :image, :image_url
    add_column :reviews, :book_id, :integer
    add_column :reviews, :user_id, :integer
  end
end
