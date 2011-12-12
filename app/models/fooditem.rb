class Fooditem < ActiveRecord::Base

  validates :name, :presence => :true

end
