require 'test_helper'

class FooditemTest < ActiveSupport::TestCase

  setup do
    # fixture one
    @fooditem = fooditems(:one)
    # new and unsaved fooditem
    @new_fooditem = Fooditem.new(@fooditem.attributes.merge({:name => 'New' }))
  end

  test "should save valid fooditem" do
    assert @new_fooditem.valid?
    assert @new_fooditem.save
  end

  test "should not save fooditem without a name" do
    @new_fooditem.name = ''
    assert @new_fooditem.invalid?
    assert @new_fooditem.errors[:name].any?
    assert !@new_fooditem.save, "Saved the fooditem without a name"
  end

end
