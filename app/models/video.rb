class Video < ActiveRecord::Base

  require 'json'

  # associactions
  belongs_to :channel, :counter_cache => true
  has_and_belongs_to_many :categories

  # validations
  validates_presence_of :video_id
  validates_uniqueness_of :video_id
  validates_presence_of :channel_id


  def create_video(params)
    api_key = "AIzaSyC0HWiU5e7AFkXt2NMNBkPmPOVgC_QDx_0"
    video_id = params[:video][:video_id]
    http = Curl.get("https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&key=#{api_key}&part=snippet,contentDetails,statistics,status")
    data = JSON.load(http.body_str)
    self.video_id = data["items"][0]["id"]
    self.video_url = params[:video][:video_url]
    self.title = data["items"][0]["snippet"]["title"]
    self.channel_id = Channel.get_or_create_channel(data["items"][0]["snippet"]["channelId"], data["items"][0]["snippet"]["categoryId"])
    self.thumbnail_medium = data["items"][0]["snippet"]["thumbnails"]["medium"]["url"] if data["items"][0]["snippet"]["thumbnails"] && data["items"][0]["snippet"]["thumbnails"]["medium"]
    self.thumbnail_high = data["items"][0]["snippet"]["thumbnails"]["high"]["url"]  if data["items"][0]["snippet"]["thumbnails"] && data["items"][0]["snippet"]["thumbnails"]["high"]
    self.thumbnail_standard = data["items"][0]["snippet"]["thumbnails"]["standard"]["url"]  if data["items"][0]["snippet"]["thumbnails"] && data["items"][0]["snippet"]["thumbnails"]["standard"]
    self.description = data["items"][0]["snippet"]["description"]
    self.published_at = data["items"][0]["snippet"]["publishedAt"]
    self.view_count = data["items"][0]["statistics"]["viewCount"]
    self.like_count = data["items"][0]["statistics"]["likeCount"]
    self.dislike_count = data["items"][0]["statistics"]["dislikeCount"]
    self.comment_count = data["items"][0]["statistics"]["commentCount"]
    self.categories = Category.find params[:video][:category_ids].reject! { |c| c.empty? }
    self.save!
  end

  class << self
  end

end
