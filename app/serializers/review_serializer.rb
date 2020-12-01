class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :recommend, :rating
  belongs_to :user
  belongs_to :book
end
