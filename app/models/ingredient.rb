class Ingredient < ActiveRecord::Base

  belongs_to :fooditem
  validates :name, :presence => :true

end
