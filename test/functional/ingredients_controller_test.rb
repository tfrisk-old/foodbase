require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase

  test "ingredient listing" do
    get :index
    assert_response :success
    assert assigns(:ingredients)
  end

  test "show ingredient" do
    ingredient = ingredients(:one)
    get :show, id: ingredient.id
    assert_response :success
    assert assigns(:ingredient)
    assert_equal ingredient, assigns(:ingredient)
  end

  test "new ingredient" do
    get :new
    assert_response :success
    assert assigns(:ingredient)
    assert assigns(:ingredient).new_record?
  end

  test "create ingredient with valid parameters" do
    assert_difference("Ingredient.count", +1) do
      post :create, ingredient: {name: 'New item', description: 'Brand new item'}
      assert_response :redirect
      assert_redirected_to ingredients_path
      assert flash[:notice]
    end
  end

  test "create ingredient with invalid parameters" do
    post :create, book: {name: '', description: 'No such item'}
    assert_response :success
    assert assigns(:ingredient)
    assert assigns(:ingredient).new_record?
    assert_template :new
  end

  test "edit ingredient" do
    ingredient = ingredients(:one)
    get :edit, id: ingredient.id
    assert_response :success
    assert assigns(:ingredient)
    assert_equal ingredient, assigns(:ingredient)
  end

  test "update ingredient with valid parameters" do
    ingredient = ingredients(:one)
    put :update, id: ingredient.id, ingredient: {name: 'Modified name',
        description: 'New description'}
    assert_response :redirect
    assert_redirected_to ingredient_path(ingredient)
    assert flash[:notice]
  end

  test "update ingredient with invalid parameters" do
    ingredient = ingredients(:one)
    put :update, id: ingredient.id, ingredient: {name: '',
        description: 'New description'}
    assert_response :success
    assert_template :edit
    assert assigns(:ingredient)
    assert !assigns(:ingredient).valid?
    assert assigns(:ingredient).changed?
  end

  test "delete ingredient" do
    ingredient = ingredients(:one)
    assert_difference("Ingredient.count", -1) do
      post :destroy, id: ingredient.id
      assert_response :redirect
      assert_redirected_to ingredients_path
      assert flash[:notice]
    end
  end

end
