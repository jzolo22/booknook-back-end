class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :recommend, :rating, :book_id, :username, :user_id, :title
  belongs_to :user
  belongs_to :book

  def username 
    self.object.user.username
  end

  def title
    self.object.book.title
  end


end
