class State < ActiveRecord::Base

has_many :districts, :dependent => :destroy

end
