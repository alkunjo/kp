require 'test_helper'

class GrupObatsControllerTest < ActionController::TestCase
  setup do
    @grup_obat = grup_obats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grup_obats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grup_obat" do
    assert_difference('GrupObat.count') do
      post :create, grup_obat: { gobat_name: @grup_obat.gobat_name }
    end

    assert_redirected_to grup_obat_path(assigns(:grup_obat))
  end

  test "should show grup_obat" do
    get :show, id: @grup_obat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grup_obat
    assert_response :success
  end

  test "should update grup_obat" do
    patch :update, id: @grup_obat, grup_obat: { gobat_name: @grup_obat.gobat_name }
    assert_redirected_to grup_obat_path(assigns(:grup_obat))
  end

  test "should destroy grup_obat" do
    assert_difference('GrupObat.count', -1) do
      delete :destroy, id: @grup_obat
    end

    assert_redirected_to grup_obats_path
  end
end
