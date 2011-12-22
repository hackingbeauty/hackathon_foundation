require 'digest'

class User < ActiveRecord::Base
  has_many :authentications
  has_many :visits, :dependent => :destroy
  has_many :visitations, :through => :visits, :source => :coordinate
  has_many :profiles  
 
  attr_accessible :name, :phone, :info
end

