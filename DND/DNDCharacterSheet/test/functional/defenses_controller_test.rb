require 'test_helper'

class DefensesControllerTest < ActionController::TestCase
  setup do
    @defense = defenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:defenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create defense" do
    assert_difference('Defense.count') do
      post :create, :defense => @defense.attributes
    end

    assert_redirected_to defense_path(assigns(:defense))
  end

  test "should show defense" do
    get :show, :id => @defense.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @defense.to_param
    assert_response :success
  end

  test "should update defense" do
    put :update, :id => @defense.to_param, :defense => @defense.attributes
    assert_redirected_to defense_path(assigns(:defense))
  end

  test "should destroy defense" do
    assert_difference('Defense.count', -1) do
      delete :destroy, :id => @defense.to_param
    end

    assert_redirected_to defenses_path
  end
end
