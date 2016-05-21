require 'test_helper'

class KategoriObatsControllerTest < ActionController::TestCase
  setup do
    @kategori_obat = kategori_obats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kategori_obats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kategori_obat" do
    assert_difference('KategoriObat.count') do
      post :create, kategori_obat: { kobat_name: @kategori_obat.kobat_name }
    end

    assert_redirected_to kategori_obat_path(assigns(:kategori_obat))
  end

  test "should show kategori_obat" do
    get :show, id: @kategori_obat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kategori_obat
    assert_response :success
  end

  test "should update kategori_obat" do
    patch :update, id: @kategori_obat, kategori_obat: { kobat_name: @kategori_obat.kobat_name }
    assert_redirected_to kategori_obat_path(assigns(:kategori_obat))
  end

  test "should destroy kategori_obat" do
    assert_difference('KategoriObat.count', -1) do
      delete :destroy, id: @kategori_obat
    end

    assert_redirected_to kategori_obats_path
  end
end
