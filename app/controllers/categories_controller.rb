class CategoriesController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    @categories = Category.includes(:videos).where(:category_type => "main")
  end

  def show
    @category = Category.friendly.find_by_slug(params[:id])
    per_page = params[:per_page] || 6
    if params[:sort] == 'popular'
      @videos = @category.videos.order('view_count desc').paginate(:page => current_page, :per_page => per_page)
    else
      @videos = @category.videos.order('id desc').paginate(:page => current_page, :per_page => per_page)
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
