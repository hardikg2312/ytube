class Channel < ActiveRecord::Base

  # associactions
  has_many :videos

  # validations
  validates_presence_of   :ytube_id
  validates_uniqueness_of :ytube_id

  class << self
    def get_or_create_channel(id, category_id)
      channel = Channel.find_or_initialize_by(:ytube_id => id)
      http = Curl.get("http://gdata.youtube.com/feeds/api/users/#{id}")
      channel_hash = Hash.from_xml(http.body_str)
      channel.ytube_id = id
      channel.channel_category_id = category_id
      channel.title = channel_hash["entry"]["title"]
      channel.content = channel_hash["entry"]["content"]
      channel.thumbnail =  channel_hash["entry"]["thumbnail"]["url"]
      channel.subscriptions = channel_hash["entry"]["statistics"]["subscriberCount"]
      channel.total_views = channel_hash["entry"]["statistics"]["totalUploadViews"]
      channel.channel_url =  channel_hash["entry"]["link"][0]['href']
      channel.save!
      channel.id
    end
  end
end
