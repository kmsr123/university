ActiveAdmin.register Student do

#decorate_with StudentDecorator
#filter :country, as: :country
#filter :state, as: :state
  #class => "container" do 
#attr_accessor :state
#permit_params :state
form do |f|
    f.inputs "Student" do 
    f.input :first_name ,:input_html => { :maxlength => 10 },:placeholder => "first name should be max seven character"
    f.input :last_name, :input_html => { :size => 6 },:label => "LASTNAME",:placeholder => "last name should be max seven character"
    f.input :fathername
    f.input :dob ,:label => "Date_of_birth", :as => :date_select, :start_year => 1990, :end_year => 2013,:placeholder => "years must be in 1990-2008"
    f.input :gender,:label => "Gender", :as => :radio, :collection => ['male', 'female']
    f.input :section,:label => "Branch", :as => :select, :collection => ["cse","ece","eee","mech"]
    f.input :age
    f.input :phono
   # f.input :email
    f.input :fee, :label => "Fee"
    f.input :photo,:label =>"Photo", :as => :file
    f.input :country,as: :country_select,:as => :select,:collection => Country.all
end 
   f.inputs :for => [:address, f.object.address || Address.new ] do |address|
   address.input :state,:label => "State",:placeholder => "select state in india",
   :collection => State.all.map {|t| t.name}
   address.input :district,:label => "District",:placeholder => "select district in below ones",
   :collection => District.all.map {|t| t.name}
   address.input :town, :label =>  "Town", :placeholder => "select only meto"
   address.input :zipcode, :label => "zipCode", :as => :number,:placeholder => " it should be 6 digit"
end
f.actions
end

  index  do 
    
      column :id
      column :full_name 
      column :fathername
      column :section
      column :gender
      column :dob
      column :age
      column :email
      column :fee
      column :phono
      column :country
      column :state do |f|
         f.address.state
      end
      actions do |t|  
        link_to "Student_pdf", student_path(t, :format => 'pdf')
        #link_to "semister_one", new_admin_semister_path
      end

  end


  show do |f|
     attributes_table do
        row :id
        row :full_name
        row :fathername
        row :section
        row :gender
        row :dob
        row :age
        row :fee
        row :phono
        row :email do |f|
          strong{f.email}
        end
        row :country

        row :state do 
         f.address.state
        end 
        row :district do 
          f.address.district
        end
        row :town do 
          f.address.town
        end
        row :village do 
          f.address.village
        end
        row :zipcode do 
          f.address.zipcode
        end
        row :photo do 
         image_tag(f.photo.url)
        end
        row :semister_one do |t|
          #semister_one = t.semisters.find_by_semister_name("one")
          #puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44"
          #puts semister_one.inspect
          #puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
         #link_to "Student_pdf", student_path(t)
        end
   end
   active_admin_comments
 end


filter :full_name, :label => "fullname"
filter :fathername, :label => "fathername"
filter :gender, :label => "Gender"
filter :section, :label => "Section"
filter :age, :label => "Age"
filter :email, :label => "email_id"
filter :fee, :label => "Fee"
filter :phone, :label => "PhoneNumber"
#filter :country, :label => "Country"
#filter :address,:label => "state", :collection => proc{(Address.all).map{|c| [c.state, c.id]}}
filter :address, :label => "state", :collection => Address.all.map {|t| t.state}.uniq
#filter :description, :label => "Change Me"
#filter :student, :label => "Change Me"

 #actions do |post|
  #    link_to "Preview", admin_preview_post_path(post), :class => "member_link"
   # end



controller do
    def scoped_collection
      Student.includes(:address,:semisters)
    end
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
  config.per_page = 2
  #index :pagination_total => false
  #config.paginate = true


end