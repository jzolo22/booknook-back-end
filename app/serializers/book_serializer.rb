class BookSerializer < ActiveModel::Serializer
  attributes  :title, :author, :id, :image_url, :description
  has_many :reviews
  # make sure syntax is correct
end
