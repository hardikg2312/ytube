class VideosController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    # @category = Category.friendly.find_by_slug(params[:category_id])
    @videos = Video.all
  end

  def show
    @video = Video.find_by_video_id(params[:id])
  end

  private
  def get_bottem_class
    @video_border_class = 'active_border'
  end

end
