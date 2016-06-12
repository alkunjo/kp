require 'test_helper'

class TransTypesControllerTest < ActionController::TestCase
  setup do
    @trans_type = trans_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trans_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trans_type" do
    assert_difference('TransType.count') do
      post :create, trans_type: { ttype_name: @trans_type.ttype_name }
    end

    assert_redirected_to trans_type_path(assigns(:trans_type))
  end

  test "should show trans_type" do
    get :show, id: @trans_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trans_type
    assert_response :success
  end

  test "should update trans_type" do
    patch :update, id: @trans_type, trans_type: { ttype_name: @trans_type.ttype_name }
    assert_redirected_to trans_type_path(assigns(:trans_type))
  end

  test "should destroy trans_type" do
    assert_difference('TransType.count', -1) do
      delete :destroy, id: @trans_type
    end

    assert_redirected_to trans_types_path
  end
end
