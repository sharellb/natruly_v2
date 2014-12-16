class Salon < ActiveRecord::Base
	validates_presence_of :address, :name
 	validates :address, uniqueness: true
	geocoded_by :address
	before_save :geocode
end



	
