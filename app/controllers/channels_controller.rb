class ChannelsController < ApplicationController
  before_filter :get_bottem_class, :only => [:index]

  def index
    @channels = Channel.all
  end

  private
  def get_bottem_class
    @channel_border_class = 'active_border'
  end
end
