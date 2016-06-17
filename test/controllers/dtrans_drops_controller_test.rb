require 'test_helper'

class DtransDropsControllerTest < ActionController::TestCase
  setup do
    @dtrans_drop = dtrans_drops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dtrans_drops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dtrans_drop" do
    assert_difference('DtransDrop.count') do
      post :create, dtrans_drop: { dtd_qty: @dtrans_drop.dtd_qty, dtd_req: @dtrans_drop.dtd_req, dtd_rsn: @dtrans_drop.dtd_rsn, obat_id: @dtrans_drop.obat_id, transaksi_drop_id: @dtrans_drop.transaksi_drop_id }
    end

    assert_redirected_to dtrans_drop_path(assigns(:dtrans_drop))
  end

  test "should show dtrans_drop" do
    get :show, id: @dtrans_drop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dtrans_drop
    assert_response :success
  end

  test "should update dtrans_drop" do
    patch :update, id: @dtrans_drop, dtrans_drop: { dtd_qty: @dtrans_drop.dtd_qty, dtd_req: @dtrans_drop.dtd_req, dtd_rsn: @dtrans_drop.dtd_rsn, obat_id: @dtrans_drop.obat_id, transaksi_drop_id: @dtrans_drop.transaksi_drop_id }
    assert_redirected_to dtrans_drop_path(assigns(:dtrans_drop))
  end

  test "should destroy dtrans_drop" do
    assert_difference('DtransDrop.count', -1) do
      delete :destroy, id: @dtrans_drop
    end

    assert_redirected_to dtrans_drops_path
  end
end
