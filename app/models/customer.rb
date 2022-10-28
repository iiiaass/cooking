class Customer < ApplicationRecord
   has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:comments,dependent: :destroy
  has_many:posts,dependent: :destroy
  has_many:nices,dependent: :destroy

  def self.guest
    find_or_create_by!(introduction:'reading',first_name:'user',last_name: 'guest',email: 'guests@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name="guest"
      customer.first_name="user"
      customer.introduction="reading"
    end
  end

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
     profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
