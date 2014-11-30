class Category < ActiveRecord::Base

	validates_presence_of   :category_name
end
