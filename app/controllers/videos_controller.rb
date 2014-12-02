class VideosController < ApplicationController

  def index
    @category = Category.friendly.find_by_slug(params[:category_id])
    @videos = @category.videos
  end

end
