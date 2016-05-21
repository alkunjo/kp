require 'test_helper'

class KrediturPabriksControllerTest < ActionController::TestCase
  setup do
    @kreditur_pabrik = kreditur_pabriks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kreditur_pabriks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kreditur_pabrik" do
    assert_difference('KrediturPabrik.count') do
      post :create, kreditur_pabrik: { kreditur_id: @kreditur_pabrik.kreditur_id, pabrik_id: @kreditur_pabrik.pabrik_id }
    end

    assert_redirected_to kreditur_pabrik_path(assigns(:kreditur_pabrik))
  end

  test "should show kreditur_pabrik" do
    get :show, id: @kreditur_pabrik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kreditur_pabrik
    assert_response :success
  end

  test "should update kreditur_pabrik" do
    patch :update, id: @kreditur_pabrik, kreditur_pabrik: { kreditur_id: @kreditur_pabrik.kreditur_id, pabrik_id: @kreditur_pabrik.pabrik_id }
    assert_redirected_to kreditur_pabrik_path(assigns(:kreditur_pabrik))
  end

  test "should destroy kreditur_pabrik" do
    assert_difference('KrediturPabrik.count', -1) do
      delete :destroy, id: @kreditur_pabrik
    end

    assert_redirected_to kreditur_pabriks_path
  end
end
