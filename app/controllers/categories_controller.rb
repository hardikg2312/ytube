class CategoriesController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    @categories = Category.includes(:videos).where(:category_type => "main")
  end

  def show
    @category = Category.friendly.find_by_slug(params[:id])
    if params[:sort] == 'popular'
      @videos = @category.videos.order('view_count desc')
    else
      @videos = @category.videos.order('published_at desc')
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def get_bottem_class
    @category_border_class = 'active_border'
  end
end
