require 'test_helper'

class FooditemsControllerTest < ActionController::TestCase

  test "fooditem listing" do
    get :index
    assert_response :success
    assert assigns(:fooditems)
  end

end
