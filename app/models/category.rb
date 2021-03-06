class Category < ActiveRecord::Base

  # associactions
  has_and_belongs_to_many :videos
  has_many :channels

  # validations
	validates_presence_of   :category_name
	validates_uniqueness_of :slug    # uniq also at database level

	extend FriendlyId
  friendly_id :category_name, use: :slugged
  mount_uploader :category_photo, ImageUploader
end
