class VideosController < ApplicationController

  def index
    @category = Category.friendly.find_by_slug(params[:category_id])
    @videos = @category.videos
  end

  def show
    @video = Video.find_by_video_id(params[:id])
  end

end
