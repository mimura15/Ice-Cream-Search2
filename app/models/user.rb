class User < ApplicationRecord

  has_many :posts
  has_many :reviews
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true

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

  def is_guest?
   if  self.email == 'guest@example.com'
     return true
   end
   return false
  end


end
