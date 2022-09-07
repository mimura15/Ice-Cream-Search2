class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many_attached :images
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :content, presence: true
end
