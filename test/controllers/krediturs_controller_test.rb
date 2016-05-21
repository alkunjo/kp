require 'test_helper'

class KreditursControllerTest < ActionController::TestCase
  setup do
    @kreditur = krediturs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:krediturs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kreditur" do
    assert_difference('Kreditur.count') do
      post :create, kreditur: { kreditur_address: @kreditur.kreditur_address, kreditur_cp: @kreditur.kreditur_cp, kreditur_email: @kreditur.kreditur_email, kreditur_fax: @kreditur.kreditur_fax, kreditur_name: @kreditur.kreditur_name, kreditur_phone: @kreditur.kreditur_phone }
    end

    assert_redirected_to kreditur_path(assigns(:kreditur))
  end

  test "should show kreditur" do
    get :show, id: @kreditur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kreditur
    assert_response :success
  end

  test "should update kreditur" do
    patch :update, id: @kreditur, kreditur: { kreditur_address: @kreditur.kreditur_address, kreditur_cp: @kreditur.kreditur_cp, kreditur_email: @kreditur.kreditur_email, kreditur_fax: @kreditur.kreditur_fax, kreditur_name: @kreditur.kreditur_name, kreditur_phone: @kreditur.kreditur_phone }
    assert_redirected_to kreditur_path(assigns(:kreditur))
  end

  test "should destroy kreditur" do
    assert_difference('Kreditur.count', -1) do
      delete :destroy, id: @kreditur
    end

    assert_redirected_to krediturs_path
  end
end
