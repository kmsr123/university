class Semister < ActiveRecord::Base

has_one :subject
has_many :semister_students
has_many :students, :through => :semister_students 


end
