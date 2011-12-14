require 'test_helper'

class IngredientTest < ActiveSupport::TestCase

  setup do
    # fixture one
    @ingredient = ingredients(:one)
    # new and unsaved ingredient
    @new_ingredient = Fooditem.new(@ingredient.attributes.merge({:name => 'New' }))
  end

  test "should save valid ingredient" do
    assert @new_ingredient.valid?
    assert @new_ingredient.save
  end

  test "should not save ingredient without a name" do
    @new_ingredient.name = ''
    assert @new_ingredient.invalid?
    assert @new_ingredient.errors[:name].any?
    assert !@new_ingredient.save, "Saved the ingredient without a name"
  end

end
