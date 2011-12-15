class Ingredient < ActiveRecord::Base

  # http://tech.thereq.com/post/12671192370/rails3-forms-for-has-many-through-and-nested-models
  has_many :fooditem_ingredients
  has_many :fooditems, :through => :fooditem_ingredients

  validates :name, :presence => :true

end
