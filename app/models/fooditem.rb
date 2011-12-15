class Fooditem < ActiveRecord::Base

  # try to map ingredients properly
  # http://tech.thereq.com/post/12671192370/rails3-forms-for-has-many-through-and-nested-models
  has_many :fooditem_ingredients, :include => :ingredient
  has_many :ingredients, :through => :fooditem_ingredients
  accepts_nested_attributes_for :fooditem_ingredients, :allow_destroy => :true

  validates :name, :presence => :true

end
