class VideosController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    per_page = params[:per_page] || 15
    if params[:sort] == 'popular'
      @videos = Video.includes(:channel).order('view_count desc').paginate(:page => current_page, :per_page => per_page)
    else
      @videos = Video.includes(:channel).order('id desc').paginate(:page => current_page, :per_page => per_page)
    end
    # if params[:categories]
    #   @category_ids = params[:categories][:category_ids].reject! { |c| c.empty? }
    #   @parse_categories = @category_ids.join(",")
    # end
    # if !params[:category_ids].blank?
    #   @category_ids = params[:category_ids].split(",").map {|c| c.to_i}
    #   @parse_categories = @category_ids.join(",")
    # end
    # if params[:sort] == 'popular'
      # if @category_ids.blank?
        # @videos = Video.includes(:channel).order('view_count desc').paginate(:page => current_page, :per_page => per_page)
      # else
      #   @videos = Video.joins(:categories).includes(:channel,).order('view_count desc').where('categories_videos.category_id in (?)',@category_ids).uniq.paginate(:page => current_page, :per_page => per_page)
      # end
    # else
      # if @category_ids.blank?
        # @videos = Video.includes(:channel).order('id desc').paginate(:page => current_page, :per_page => per_page)
      # else
      #   @videos = Video.joins(:categories).includes(:channel,).order('id desc').where('categories_videos.category_id in (?)',@category_ids).uniq.paginate(:page => current_page, :per_page => per_page)
      # end
    # end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @video = Video.find_by_video_id(params[:id])
  end

  private
  def get_bottem_class
    @video_border_class = 'active_border'
  end

end
