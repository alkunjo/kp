require 'test_helper'

class OutletTypesControllerTest < ActionController::TestCase
  setup do
    @outlet_type = outlet_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outlet_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outlet_type" do
    assert_difference('OutletType.count') do
      post :create, outlet_type: { otype_name: @outlet_type.otype_name }
    end

    assert_redirected_to outlet_type_path(assigns(:outlet_type))
  end

  test "should show outlet_type" do
    get :show, id: @outlet_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outlet_type
    assert_response :success
  end

  test "should update outlet_type" do
    patch :update, id: @outlet_type, outlet_type: { otype_name: @outlet_type.otype_name }
    assert_redirected_to outlet_type_path(assigns(:outlet_type))
  end

  test "should destroy outlet_type" do
    assert_difference('OutletType.count', -1) do
      delete :destroy, id: @outlet_type
    end

    assert_redirected_to outlet_types_path
  end
end
