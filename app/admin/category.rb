ActiveAdmin.register Category do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :category_name, :category_photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_name]
  #   permitted << :other if resource.something?
  #   permitted
  # end

   #form do |f|
   #   f.inputs "Details" do
   #     f.input :category_name
   #   end
   #   f.actions
   # end

end
