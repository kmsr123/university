class Student < ActiveRecord::Base
 rolify
attr_accessor :first_name, :last_name, :photo

has_one :address, :as => :addressable, dependent: :destroy

has_attached_file :photo, :styles => { :thumb => "100x100>" }
                             

has_many :student_teachers
has_many :teachers, :through => :student_teachers

has_many :student_semisters
has_many :semisters, :through => :student_semisters


#has_attached_file :map, :styles => { :medium => "238x238>", 
                                   #:thumb => "100x100>"
                                 #}
#validates_presence_of :full_name,:fathername,:gender,:dob,:age,:fee,:email,:section,:photo

#validates :age, numericality: true
#validates_inclusion_of :age, in: 0..99
#validates :full_name, uniqueness: true
#validates :email, uniqueness: true
#validates :full_name, length: { maximum: 15 }
#validates :full_name, length: { minimum: 5 }
#validates :full_name, exclusion: { in: %w(admin superuser ) }
#validates :gender, inclusion: %w(male female)
#validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "badformat" }
#has_one :address, :as => :addressable, dependent: :destroy
#has_many :marks, dependent: :destroy

accepts_nested_attributes_for :address

   before_save :bsave
   after_save :email_devise

   def bsave
   
    self.full_name = self.first_name + self.last_name
       if (self.email == nil)
       self.email = self.first_name + self.last_name.first + self.id.to_s + rand(2345..9999).to_s + "@gmail.com"
      end
   end

   def email_devise

   user = User.create(:email =>"#{self.email}",:password => "123456789").add_role :student
   end

 end