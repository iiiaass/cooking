class Post < ApplicationRecord
  has_one_attached:image
  has_many:comments,dependent: :destroy
  has_many:nices,dependent: :destroy
  belongs_to:customer
  belongs_to:genre
  
  def self.search(search)
    return Post.all unless search
    Post.where(['content LIKE ?', "%#{search}%"])
  end
end
