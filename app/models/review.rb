class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :comments

  validates :title, presence: true
  validates :ice_name, presence: true
  validates :price, presence: true
  validates :feedback, presence:true
end
