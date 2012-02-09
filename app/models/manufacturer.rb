class Manufacturer < ActiveRecord::Base

  has_many :fooditems

  validates :name, :presence => :true

end
