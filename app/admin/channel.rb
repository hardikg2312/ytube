ActiveAdmin.register Channel do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :category_id, :ytube_id, :title
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
    column "category" do |channel|
      channel.category.category_name if channel.category
    end
    column :ytube_id
    column :channel_category_id
    column :title
    column :subscriptions
    column :total_views
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.label :select_category
      f.collection_select :category_id, Category.all , :id, :category_name, {}
      f.input :ytube_id
      f.input :title
      f.input :content
      f.input :channel_category_id
      f.input :subscriptions
      f.input :total_views
      f.input :channel_url
    end
    f.actions
  end

  preserve_default_filters!
  filter :category, :as => :select, :collection => Category.all.collect {|c| [c.category_name, c.id]}



end
