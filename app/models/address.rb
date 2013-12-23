class Address < ActiveRecord::Base
	belongs_to :addressabe, :polymorphic => true
end
