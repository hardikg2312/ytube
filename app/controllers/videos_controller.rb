class VideosController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    per_page = params[:per_page] || 15
    if params[:sort] == 'popular'
      @videos = Video.includes(:channel).order('view_count desc').paginate(:page => current_page, :per_page => per_page)
    else
      @videos = Video.includes(:channel).order('id desc').paginate(:page => current_page, :per_page => per_page)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @video = Video.find_by_video_id(params[:id])
  end

  def update
    video = Video.find_by_id(params[:id])
    video.tag_list = params[:video][:tag_list]
    video.save!
    respond_to do |format|
      format.js
    end
  end

  private
  def get_bottem_class
    @video_border_class = 'active_border'
  end

end
