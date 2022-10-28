class Post < ApplicationRecord
  has_one_attached:image
  has_many:comments,dependent: :destroy
  has_many:nices,dependent: :destroy
  belongs_to:customer
  belongs_to:genre

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE (?) OR article LIKE (?)',"%#{search}%", "%#{search}%"])
  end


  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
