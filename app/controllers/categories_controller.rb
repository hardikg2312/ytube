class CategoriesController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    categories = Category.includes(:videos).where(:category_type => "main").order('category_name')
    @categories = categories.group_by { |c| c.category_name[0] }
  end

  def show
    @category = Category.friendly.find_by_slug(params[:id])
    @sub_category = Category.includes(:videos).where(:category_type => "sub", :parent_category => @category.id).order('category_name')
    per_page = params[:per_page] || 6
    if params[:sort] == 'popular'
      @videos = @category.videos.order('view_count desc').paginate(:page => current_page, :per_page => per_page)
    else
      @videos = @category.videos.order('id desc').paginate(:page => current_page, :per_page => per_page)
    end
    @channels = @category.channels.order('channels.subscriptions desc').limit(12)
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
