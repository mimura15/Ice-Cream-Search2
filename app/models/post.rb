class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many_attached :images
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :content, presence: true

  def save_tag!(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tag = Tag.find_by(tag_name: old)
      tag_maps.find_by(tag_id: tag.id).destroy!
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by!(tag_name: new)
      tag_maps.create!(tag_id: new_post_tag.id)
    end
  end

end
