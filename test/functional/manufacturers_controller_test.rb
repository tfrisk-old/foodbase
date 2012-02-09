require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
  test "manufacturer listing" do
    get :index
    assert_response :success
    assert assigns(:manufacturers)
  end

  test "show manufacturer" do
    manufacturer = manufacturers(:one)
    get :show, id: manufacturer.id
    assert_response :success
    assert assigns(:manufacturer)
    assert_equal manufacturer, assigns(:manufacturer)
  end

  test "new manufacturer" do
    get :new
    assert_response :success
    assert assigns(:manufacturer)
    assert assigns(:manufacturer).new_record?
  end

  test "create manufacturer with valid parameters" do
    assert_difference("Manufacturer.count", +1) do
      post :create, manufacturer: {name: 'New manufacturer', description: 'Brand new manufacturer'}
      assert_response :redirect
      assert_redirected_to manufacturers_path
      assert flash[:notice]
    end
  end

  test "create manufacturer with invalid parameters" do
    post :create, manufacturer: {name: '', description: 'No such manufacturer'}
    assert_response :success
    assert assigns(:manufacturer)
    assert assigns(:manufacturer).new_record?
    assert_template :new
  end

  test "edit manufacturer" do
    manufacturer = manufacturers(:one)
    get :edit, id: manufacturer.id
    assert_response :success
    assert assigns(:manufacturer)
    assert_equal manufacturer, assigns(:manufacturer)
  end

  test "update manufacturer with valid parameters" do
    manufacturer = manufacturers(:one)
    put :update, id: manufacturer.id, manufacturer: {name: 'Modified name',
        description: 'New description'}
    assert_response :redirect
    assert_redirected_to manufacturer_path(manufacturer)
    assert flash[:notice]
  end

  test "update manufacturer with invalid parameters" do
    manufacturer = manufacturers(:one)
    put :update, id: manufacturer.id, manufacturer: {name: '',
        description: 'New description'}
    assert_response :success
    assert_template :edit
    assert assigns(:manufacturer)
    assert !assigns(:manufacturer).valid?
    assert assigns(:manufacturer).changed?
  end

  test "delete manufacturer" do
    manufacturer = manufacturers(:one)
    assert_difference("Manufacturer.count", -1) do
      post :destroy, id: manufacturer.id
      assert_response :redirect
      assert_redirected_to manufacturers_path
      assert flash[:notice]
    end
  end
end
