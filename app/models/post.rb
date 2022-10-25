class Post < ApplicationRecord
  has_one_attached:image
  has_many:comments,dependent: :destroy
  has_many:nices,dependent: :destroy
  belongs_to:customer
  belongs_to:genre
end
