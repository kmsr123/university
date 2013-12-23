ActiveAdmin.register Teacher do


form do |f|
    f.inputs "Teacher" do 
    f.input :full_name
    f.input :gender
    f.input :experience
    f.input :salary
    f.input :subjects, :as => :check_boxes, :collection => ["ece", "cse", "it", "civil", "mechanical"]
    f.input :phone, :autofocus => true 
    f.input :email
    f.input :photo, :as => :file
    end

   #f.inputs "Address", :for => [:address, Address.new] do |address|
   f.inputs :for => [:address, Address.new ] do |address|
   address.input :state
   address.input :district
   address.input :town
   address.input :zipcode, :as => :number
  end
    f.actions
  end



  index do
      column :id
      column :full_name
      column :experience
      column :salary
      column :subjects
      column :phone
      column :email
      column :state do |f|
      f.address.state
  end
  default_actions
  end

show do |f|
     attributes_table do
        row :id
        row :full_name
        row :gender
        row :email
        row :salary
        row :state do 
        f.address.state
        end 
        row :district do 
          f.address.district
        end
        row :state do 
          f.address.town
        end
        row :state do 
          f.address.village
        end
        row :village do 
          f.address.village
        end
        row :photo do 
         image_tag(f.photo.url)
        end
   end
   active_admin_comments
 end
  


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
