class ChannelsController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    category_ids = params[:categories][:category_ids].reject! { |c| c.empty? } if params[:categories]
    if category_ids.blank?
      @channels = Channel.order('subscriptions desc').includes(:category)
    else
      @channels = Channel.order('subscriptions desc').includes(:category).where('channels.category_id in (?)',category_ids)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    channel = Channel.friendly.find_by_slug(params[:id])
    @videos = channel.videos.order('view_count desc')
  end

  private
  def get_bottem_class
    @channel_border_class = 'active_border'
  end
end
