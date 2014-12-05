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
    f.inputs "Select Categories" do
      f.label :select_category
      div :class => "category_select" do
        f.collection_select :category_ids, Category.all , :id, :category_name, {}, {:multiple => true}
      end
    end
    f.actions
  end

  preserve_default_filters!
  filter :categories, :as => :select, :collection => Category.all.collect {|c| [c.category_name, c.id]}

  controller do
    def create
      video = Video.find_by_video_id(params[:video][:video_id])
      if video
        redirect_to edit_admin_video_path(video)
      else
        video = Video.new
        video.create_video(params)
        redirect_to admin_videos_path
      end
    end

    def update
      video = Video.find_by_video_id(params[:video][:video_id])
      video.create_video(params)
      redirect_to admin_videos_path
      #render :json => {"result" => video}
    end
  end
end
