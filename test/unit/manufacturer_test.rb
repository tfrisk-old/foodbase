require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase
  setup do
    # fixture one
    @manufacturer = manufacturers(:one)
    # new and unsaved manufacturer
    @new_manufacturer = Manufacturer.new(@manufacturer.attributes.merge({:name => 'New' }))
  end

  test "should save valid manufacturer" do
    assert @new_manufacturer.valid?
    assert @new_manufacturer.save
  end

  test "should not save manufacturer without a name" do
    @new_manufacturer.name = ''
    assert @new_manufacturer.invalid?
    assert @new_manufacturer.errors[:name].any?
    assert !@new_manufacturer.save, "Saved the manufacturer without a name"
  end

end
