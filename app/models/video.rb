class Video < ActiveRecord::Base

  require 'json'
  
  belongs_to :channel

  class << self
    def create_video(id, data)
      video = Video.find_or_initialize_by(:video_id => id)
      video.channel_id = Channel.get_or_create_channel(data["items"][0]["snippet"]["channelId"], data["items"][0]["snippet"]["categoryId"])
      video.video_id = data["items"][0]["id"]
      video.title = data["items"][0]["snippet"]["title"]
      video.thumbnail_medium = data["items"][0]["snippet"]["thumbnails"]["medium"]["url"] if data["items"][0]["snippet"]["thumbnails"] && data["items"][0]["snippet"]["thumbnails"]["medium"]
      video.thumbnail_high = data["items"][0]["snippet"]["thumbnails"]["high"]["url"]  if data["items"][0]["snippet"]["thumbnails"] && data["items"][0]["snippet"]["thumbnails"]["high"]
      video.thumbnail_standard = data["items"][0]["snippet"]["thumbnails"]["standard"]["url"]  if data["items"][0]["snippet"]["thumbnails"] && data["items"][0]["snippet"]["thumbnails"]["standard"]
      video.description = data["items"][0]["snippet"]["description"]
      video.published_at = data["items"][0]["snippet"]["publishedAt"]
      video.view_count = data["items"][0]["statistics"]["viewCount"]
      video.like_count = data["items"][0]["statistics"]["likeCount"]
      video.dislike_count = data["items"][0]["statistics"]["dislikeCount"]
      video.comment_count = data["items"][0]["statistics"]["commentCount"]
      video
    end
  end

end
