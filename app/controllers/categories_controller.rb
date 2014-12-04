class CategoriesController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    @categories = Category.includes(:videos)
  end

  def show
    @category = Category.friendly.find_by_slug(params[:id])
    @videos = @category.videos
  end

  private
  def get_bottem_class
    @category_border_class = 'active_border'
  end
end
