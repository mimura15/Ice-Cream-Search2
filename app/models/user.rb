class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
    end
  end

  has_many :post
  has_many :review
  has_many :comment
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true
  validates :is_active, presence: true

end
