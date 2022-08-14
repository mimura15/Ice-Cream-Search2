class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :comment
end
