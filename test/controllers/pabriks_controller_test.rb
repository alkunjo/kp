require 'test_helper'

class PabriksControllerTest < ActionController::TestCase
  setup do
    @pabrik = pabriks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pabriks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pabrik" do
    assert_difference('Pabrik.count') do
      post :create, pabrik: { name: @pabrik.name }
    end

    assert_redirected_to pabrik_path(assigns(:pabrik))
  end

  test "should show pabrik" do
    get :show, id: @pabrik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pabrik
    assert_response :success
  end

  test "should update pabrik" do
    patch :update, id: @pabrik, pabrik: { name: @pabrik.name }
    assert_redirected_to pabrik_path(assigns(:pabrik))
  end

  test "should destroy pabrik" do
    assert_difference('Pabrik.count', -1) do
      delete :destroy, id: @pabrik
    end

    assert_redirected_to pabriks_path
  end
end
