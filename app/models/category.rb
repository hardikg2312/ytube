class Category < ActiveRecord::Base
  
  # associactions
  has_and_belongs_to_many :videos

  # validations
	validates_presence_of   :category_name

	extend FriendlyId
  friendly_id :category_name, use: :slugged
end
