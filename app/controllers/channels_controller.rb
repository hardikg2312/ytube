class ChannelsController < ApplicationController
  before_filter :get_bottem_class, :except => []

  def index
    @channels = Channel.order('subscriptions desc').includes(:category)
  end

  def show
  	channel = Channel.find_by_id(params[:id])
    @videos = channel.videos.order('view_count desc')
  end

  private
  def get_bottem_class
    @channel_border_class = 'active_border'
  end
end
