#require 'test_helper'
#
#class PlayerSpellsControllerTest < ActionController::TestCase
#  setup do
#    @player_spell = player_spells(:one)
#  end
#
#  test "should get index" do
#    get :index
#    assert_response :success
#    assert_not_nil assigns(:player_spells)
#  end
#
#  test "should get new" do
#    get :new
#    assert_response :success
#  end
#
#  test "should create player_spell" do
#    assert_difference('PlayerSpell.count') do
#      post :create, :player_spell => @player_spell.attributes
#    end
#
#    assert_redirected_to player_spell_path(assigns(:player_spell))
#  end
#
#  test "should show player_spell" do
#    get :show, :id => @player_spell.to_param
#    assert_response :success
#  end
#
#  test "should get edit" do
#    get :edit, :id => @player_spell.to_param
#    assert_response :success
#  end
#
#  test "should update player_spell" do
#    put :update, :id => @player_spell.to_param, :player_spell => @player_spell.attributes
#    assert_redirected_to player_spell_path(assigns(:player_spell))
#  end
#
#  test "should destroy player_spell" do
#    assert_difference('PlayerSpell.count', -1) do
#      delete :destroy, :id => @player_spell.to_param
#    end
#
#    assert_redirected_to player_spells_path
#  end
#end