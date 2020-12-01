class BookSerializer < ActiveModel::Serializer
  attributes  :title, :author, :id
  has_many :reviews
  # make sure syntax is correct
end
