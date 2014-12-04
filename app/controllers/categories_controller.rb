class CategoriesController < ApplicationController
  before_filter :get_bottem_class, :only => [:index]

  def index
    @categories = Category.includes(:videos)
    
  end

  private
  def get_bottem_class
    @category_border_class = 'active_border'
  end
end
