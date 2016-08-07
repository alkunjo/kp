require 'test_helper'

class DtransControllerTest < ActionController::TestCase
  setup do
    @dtran = dtrans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dtrans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dtran" do
    assert_difference('Dtran.count') do
      post :create, dtran: { dt_rsn: @dtran.dt_rsn, dta_qty: @dtran.dta_qty, dtd_qty: @dtran.dtd_qty, obat_id: @dtran.obat_id, transaksi_id: @dtran.transaksi_id }
    end

    assert_redirected_to dtran_path(assigns(:dtran))
  end

  test "should show dtran" do
    get :show, id: @dtran
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dtran
    assert_response :success
  end

  test "should update dtran" do
    patch :update, id: @dtran, dtran: { dt_rsn: @dtran.dt_rsn, dta_qty: @dtran.dta_qty, dtd_qty: @dtran.dtd_qty, obat_id: @dtran.obat_id, transaksi_id: @dtran.transaksi_id }
    assert_redirected_to dtran_path(assigns(:dtran))
  end

  test "should destroy dtran" do
    assert_difference('Dtran.count', -1) do
      delete :destroy, id: @dtran
    end

    assert_redirected_to dtrans_path
  end
end
