require 'test_helper'

class FooditemsControllerTest < ActionController::TestCase

  test "fooditem listing" do
    get :index
    assert_response :success
    assert assigns(:fooditems)
  end

  test "show fooditem" do
    fooditem = fooditems(:one)
    get :show, id: fooditem.id
    assert_response :success
    assert assigns(:fooditem)
    assert_equal fooditem, assigns(:fooditem)
  end

  test "new fooditem" do
    get :new
    assert_response :success
    assert assigns(:fooditem)
    assert assigns(:fooditem).new_record?
  end

  test "create fooditem with valid parameters" do
    assert_difference("Fooditem.count", +1) do
      post :create, fooditem: {name: 'New item', description: 'Brand new item'}
      assert_response :redirect
      assert_redirected_to fooditems_path
      assert flash[:notice]
    end
  end

  test "create fooditem with invalid parameters" do
    post :create, book: {name: '', description: 'No such item'}
    assert_response :success
    assert assigns(:fooditem)
    assert assigns(:fooditem).new_record?
    assert_template :new
  end

  test "edit fooditem" do
    fooditem = fooditems(:one)
    get :edit, id: fooditem.id
    assert_response :success
    assert assigns(:fooditem)
    assert_equal fooditem, assigns(:fooditem)
  end

  test "update fooditem with valid parameters" do
    fooditem = fooditems(:one)
    put :update, id: fooditem.id, fooditem: {name: 'Modified name',
        description: 'New description'}
    assert_response :redirect
    assert_redirected_to fooditem_path(fooditem)
    assert flash[:notice]
  end

  test "update fooditem with invalid parameters" do
    fooditem = fooditems(:one)
    put :update, id: fooditem.id, fooditem: {name: '',
        description: 'New description'}
    assert_response :success
    assert_template :edit
    assert assigns(:fooditem)
    assert !assigns(:fooditem).valid?
    assert assigns(:fooditem).changed?
  end

  test "delete fooditem" do
    fooditem = fooditems(:one)
    assert_difference("Fooditem.count", -1) do
      post :destroy, id: fooditem.id
      assert_response :redirect
      assert_redirected_to fooditems_path
      assert flash[:notice]
    end
  end

end
