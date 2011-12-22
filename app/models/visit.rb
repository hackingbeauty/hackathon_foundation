class Visit < ActiveRecord::Base
  attr_accessible :coordinate_id
  
  belongs_to :user  
  belongs_to :coordinate
end
