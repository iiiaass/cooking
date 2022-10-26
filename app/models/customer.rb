class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:comments,dependent: :destroy
  has_many:posts,dependent: :destroy
  has_many:nices,dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name="ゲスト"
      customer.first_name="ユーザー"
      customer.introduction="閲覧用"
    end
  end
end
