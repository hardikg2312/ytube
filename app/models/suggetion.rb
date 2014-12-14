class Suggetion < ActiveRecord::Base

	# validations
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :suggetion_type

end
