ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :category_name, :category_photo, :category_type, :parent_category
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_name]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :id
    column :category_name
    column "Image" do |category|
      link_to(image_tag(category.category_photo.url,:width => '100', :height => '100'), admin_categories_path(category))
    end
    column :slug
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :category_name
      f.input :category_photo, :as => :file, :hint => f.template.image_tag(f.object.category_photo.url)
      f.input :category_type, :as => :select, :collection => [["Main", "main"], ["Sub","sub"]]
      f.input :parent_category, :as => :select, :collection => Category.all.map { |c| [ c.category_name, c.id ] }
    end
    f.actions
  end

  controller do
    def show
      @category = Category.friendly.find_by_slug(params[:id])
    end

    def edit
      @category = Category.friendly.find_by_slug(params[:id])
    end

    def update
      @category = Category.friendly.find_by_slug(params[:id])
      @category.category_name = params[:category][:category_name]
      @category.category_photo = params[:category][:category_photo]
      @category.category_type = params[:category][:category_type]
      @category.parent_category = params[:category][:parent_category]
      @category.save!
      redirect_to admin_categories_path
    end

    def destroy
      @category = Category.friendly.find_by_slug(params[:id])
      super
    end
  end

end
