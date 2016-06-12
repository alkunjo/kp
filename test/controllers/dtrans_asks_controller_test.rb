require 'test_helper'

class DtransAsksControllerTest < ActionController::TestCase
  setup do
    @dtrans_ask = dtrans_asks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dtrans_asks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dtrans_ask" do
    assert_difference('DtransAsk.count') do
      post :create, dtrans_ask: { dta_qty: @dtrans_ask.dta_qty, obat_id: @dtrans_ask.obat_id, transaksi_ask_id: @dtrans_ask.transaksi_ask_id }
    end

    assert_redirected_to dtrans_ask_path(assigns(:dtrans_ask))
  end

  test "should show dtrans_ask" do
    get :show, id: @dtrans_ask
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dtrans_ask
    assert_response :success
  end

  test "should update dtrans_ask" do
    patch :update, id: @dtrans_ask, dtrans_ask: { dta_qty: @dtrans_ask.dta_qty, obat_id: @dtrans_ask.obat_id, transaksi_ask_id: @dtrans_ask.transaksi_ask_id }
    assert_redirected_to dtrans_ask_path(assigns(:dtrans_ask))
  end

  test "should destroy dtrans_ask" do
    assert_difference('DtransAsk.count', -1) do
      delete :destroy, id: @dtrans_ask
    end

    assert_redirected_to dtrans_asks_path
  end
end
