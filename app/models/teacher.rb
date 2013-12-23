class Teacher < ActiveRecord::Base
rolify
attr_accessor :photo
has_attached_file :photo
 
has_one :address, :as => :addressable, dependent: :destroy

accepts_nested_attributes_for :address
has_many :student_teachers 
has_many :students, :through => :student_teachers 

#validates_presence_of :full_name, :gender, :experience, :salary, :phone, :email, :subjects

#validates :full_name, length: { maximum: 15 }
#validates :full_name, length: { minimum: 5 }
#validates :full_name, exclusion: { in: %w(admin superuser ) }
#validates :gender, inclusion: %w(male female)
#validates_inclusion_of :salary, in: 10000..90000

#validates_inclusion_of :experience, in: 3..7
#validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
#validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "badformat" }
 

#searchable do
 # text :full_name
  #text :email
  #text :students do
   #   students.map{ |stu| stu.email }
   # end
#end







end
