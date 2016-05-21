require 'test_helper'

class ObatsControllerTest < ActionController::TestCase
  setup do
    @obat = obats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obat" do
    assert_difference('Obat.count') do
      post :create, obat: { dosage_id: @obat.dosage_id, generik_id: @obat.generik_id, grup_obat_id: @obat.grup_obat_id, jenis_obat_id: @obat.jenis_obat_id, kategori_obat_id: @obat.kategori_obat_id, kemasan_id: @obat.kemasan_id, obat_askes: @obat.obat_askes, obat_hja: @obat.obat_hja, obat_hna: @obat.obat_hna, obat_hnahppn: @obat.obat_hnahppn, obat_hnask: @obat.obat_hnask, obat_hnaskppn: @obat.obat_hnaskppn, obat_hpp: @obat.obat_hpp, obat_kons: @obat.obat_kons, obat_minStock: @obat.obat_minStock, obat_name: @obat.obat_name, pabrik_id: @obat.pabrik_id, racik_id: @obat.racik_id }
    end

    assert_redirected_to obat_path(assigns(:obat))
  end

  test "should show obat" do
    get :show, id: @obat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obat
    assert_response :success
  end

  test "should update obat" do
    patch :update, id: @obat, obat: { dosage_id: @obat.dosage_id, generik_id: @obat.generik_id, grup_obat_id: @obat.grup_obat_id, jenis_obat_id: @obat.jenis_obat_id, kategori_obat_id: @obat.kategori_obat_id, kemasan_id: @obat.kemasan_id, obat_askes: @obat.obat_askes, obat_hja: @obat.obat_hja, obat_hna: @obat.obat_hna, obat_hnahppn: @obat.obat_hnahppn, obat_hnask: @obat.obat_hnask, obat_hnaskppn: @obat.obat_hnaskppn, obat_hpp: @obat.obat_hpp, obat_kons: @obat.obat_kons, obat_minStock: @obat.obat_minStock, obat_name: @obat.obat_name, pabrik_id: @obat.pabrik_id, racik_id: @obat.racik_id }
    assert_redirected_to obat_path(assigns(:obat))
  end

  test "should destroy obat" do
    assert_difference('Obat.count', -1) do
      delete :destroy, id: @obat
    end

    assert_redirected_to obats_path
  end
end
