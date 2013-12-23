class Mark < ActiveRecord::Base

	belongs_to :students
    has_many :semisters
end
