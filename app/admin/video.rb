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
      http = Curl.get("https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&key=AIzaSyCtlFuZZ3HS528pAM8VCkSKlbIeE6zr9Qc&part=snippet,contentDetails,statistics,status")
      video_hash = JSON.load(http.body_str)
      render :json => { errorcode: 0, errorstr: "Success", result: video_hash }
    end 
  end 


end
