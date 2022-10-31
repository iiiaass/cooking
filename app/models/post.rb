class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :nices, dependent: :destroy
  belongs_to :customer
  belongs_to :genre

  validate :images_limit

  def niced_by?(customer)
    nices.exists?(customer_id: customer.id)
  end

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE (?) OR article LIKE (?)',"%#{search}%", "%#{search}%"])
  end


  def get_image(width, height)
    images.first.variant(resize_to_limit: [width, height]).processed
    # unless images.attached?
    #   file_path = Rails.root.join('app/assets/images/no_image.jpg')
    #   image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    # end
    # image.variant(resize_to_limit: [width, height]).processed
  end

  private

  def images_limit
    if images.count > 7
      errors.add(:images, "画像は7枚以下にしてください。")
    end
  end
end
