class Coordinate < ActiveRecord::Base
  has_many :visits
  has_many :users, :through => :visits
  has_one :location
end
