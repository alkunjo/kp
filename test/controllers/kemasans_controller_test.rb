require 'test_helper'

class KemasansControllerTest < ActionController::TestCase
  setup do
    @kemasan = kemasans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kemasans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kemasan" do
    assert_difference('Kemasan.count') do
      post :create, kemasan: { kemasan_cap: @kemasan.kemasan_cap, kemasan_name: @kemasan.kemasan_name, kemasan_unit: @kemasan.kemasan_unit, kemasan_vol: @kemasan.kemasan_vol }
    end

    assert_redirected_to kemasan_path(assigns(:kemasan))
  end

  test "should show kemasan" do
    get :show, id: @kemasan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kemasan
    assert_response :success
  end

  test "should update kemasan" do
    patch :update, id: @kemasan, kemasan: { kemasan_cap: @kemasan.kemasan_cap, kemasan_name: @kemasan.kemasan_name, kemasan_unit: @kemasan.kemasan_unit, kemasan_vol: @kemasan.kemasan_vol }
    assert_redirected_to kemasan_path(assigns(:kemasan))
  end

  test "should destroy kemasan" do
    assert_difference('Kemasan.count', -1) do
      delete :destroy, id: @kemasan
    end

    assert_redirected_to kemasans_path
  end
end
