class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many_attached :images
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :content, presence: true

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.post_tags.delete PostTag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = PostTag.find_or_create_by(tag_name: new)
      self.post_tag << new_post_tag
    end
  end

end
