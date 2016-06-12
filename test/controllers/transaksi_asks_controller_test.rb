require 'test_helper'

class TransaksiAsksControllerTest < ActionController::TestCase
  setup do
    @transaksi_ask = transaksi_asks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaksi_asks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaksi_ask" do
    assert_difference('TransaksiAsk.count') do
      post :create, transaksi_ask: { receiver_id: @transaksi_ask.receiver_id, sender_id: @transaksi_ask.sender_id, trans_type_id: @transaksi_ask.trans_type_id }
    end

    assert_redirected_to transaksi_ask_path(assigns(:transaksi_ask))
  end

  test "should show transaksi_ask" do
    get :show, id: @transaksi_ask
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaksi_ask
    assert_response :success
  end

  test "should update transaksi_ask" do
    patch :update, id: @transaksi_ask, transaksi_ask: { receiver_id: @transaksi_ask.receiver_id, sender_id: @transaksi_ask.sender_id, trans_type_id: @transaksi_ask.trans_type_id }
    assert_redirected_to transaksi_ask_path(assigns(:transaksi_ask))
  end

  test "should destroy transaksi_ask" do
    assert_difference('TransaksiAsk.count', -1) do
      delete :destroy, id: @transaksi_ask
    end

    assert_redirected_to transaksi_asks_path
  end
end
