require 'test_helper'

class GeneriksControllerTest < ActionController::TestCase
  setup do
    @generik = generiks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generiks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generik" do
    assert_difference('Generik.count') do
      post :create, generik: { generik_name: @generik.generik_name }
    end

    assert_redirected_to generik_path(assigns(:generik))
  end

  test "should show generik" do
    get :show, id: @generik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generik
    assert_response :success
  end

  test "should update generik" do
    patch :update, id: @generik, generik: { generik_name: @generik.generik_name }
    assert_redirected_to generik_path(assigns(:generik))
  end

  test "should destroy generik" do
    assert_difference('Generik.count', -1) do
      delete :destroy, id: @generik
    end

    assert_redirected_to generiks_path
  end
end
