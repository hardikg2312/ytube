ActiveAdmin.register Video do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :video_id, :video_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :id
    column :video_id
    column :channel_id
    column :view_count
    column :like_count
    column :dislike_count
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :video_id
      f.input :video_url
    end
    f.actions
  end

  controller do
    def create
      video_id = params[:video][:video_id]
      api_key = "AIzaSyC0HWiU5e7AFkXt2NMNBkPmPOVgC_QDx_0"
      http = Curl.get("https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&key=#{api_key}&part=snippet,contentDetails,statistics,status")
      video_hash = JSON.load(http.body_str)
      video = Video.create_video(video_id, video_hash)
      #render :json => {"result" => video}
      video.video_url = params[:video][:video_url]
      video.save!
      render :index 
    end 
  end
end
