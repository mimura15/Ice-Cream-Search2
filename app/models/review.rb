class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :ice_name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99_999 }, format: { with: /\A[0-9]+\z/ }
  validates :feedback, presence:true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
