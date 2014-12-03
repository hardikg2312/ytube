class CategoriesController < ApplicationController
  before_filter :get_bottem_class, :only => [:index]

  def index
    @categories = Category.includes(:videos)
    
  end

  private
  def get_bottem_class
    @border_class = 'active_border'
  end
end
