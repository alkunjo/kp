require 'test_helper'

class RaciksControllerTest < ActionController::TestCase
  setup do
    @racik = raciks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raciks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create racik" do
    assert_difference('Racik.count') do
      post :create, racik: { racik_name: @racik.racik_name }
    end

    assert_redirected_to racik_path(assigns(:racik))
  end

  test "should show racik" do
    get :show, id: @racik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @racik
    assert_response :success
  end

  test "should update racik" do
    patch :update, id: @racik, racik: { racik_name: @racik.racik_name }
    assert_redirected_to racik_path(assigns(:racik))
  end

  test "should destroy racik" do
    assert_difference('Racik.count', -1) do
      delete :destroy, id: @racik
    end

    assert_redirected_to raciks_path
  end
end
