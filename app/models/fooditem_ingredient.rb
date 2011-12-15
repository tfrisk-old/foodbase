class FooditemIngredient < ActiveRecord::Base

  # http://tech.thereq.com/post/12671192370/rails3-forms-for-has-many-through-and-nested-models
  belongs_to :fooditem
  belongs_to :ingredient

  attr_accessor :included
  after_find :set_included

  private

  def set_included
    self.included = "1"
  end

end
