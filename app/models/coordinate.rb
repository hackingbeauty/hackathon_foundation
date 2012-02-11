class Coordinate < ActiveRecord::Base
  has_many :visits
  has_many :users, :through => :visits
  has_one :location
  reverse_geocoded_by :latitude, :longitude #set for geocoder gem
  
  after_validation :reverse_geocode  # auto-fetch address
  
end
