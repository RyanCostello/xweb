require 'test_helper'

class PlayerInventoriesControllerTest < ActionController::TestCase
  setup do
    @player_inventory = player_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_inventory" do
    assert_difference('PlayerInventory.count') do
      post :create, :player_inventory => @player_inventory.attributes
    end

    assert_redirected_to player_inventory_path(assigns(:player_inventory))
  end

  test "should show player_inventory" do
    get :show, :id => @player_inventory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @player_inventory.to_param
    assert_response :success
  end

  test "should update player_inventory" do
    put :update, :id => @player_inventory.to_param, :player_inventory => @player_inventory.attributes
    assert_redirected_to player_inventory_path(assigns(:player_inventory))
  end

  test "should destroy player_inventory" do
    assert_difference('PlayerInventory.count', -1) do
      delete :destroy, :id => @player_inventory.to_param
    end

    assert_redirected_to player_inventories_path
  end
end
