class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :telepone, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :off_day, presence: true
  validates :website, presence: true

  geocoded_by :get_address
  after_validation :geocode, if: :address_changed?

  def get_address
    self.address
  end
end
