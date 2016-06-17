require 'test_helper'

class TransaksiDropsControllerTest < ActionController::TestCase
  setup do
    @transaksi_drop = transaksi_drops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaksi_drops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaksi_drop" do
    assert_difference('TransaksiDrop.count') do
      post :create, transaksi_drop: { receiver_id: @transaksi_drop.receiver_id, sender_id: @transaksi_drop.sender_id, trans_status: @transaksi_drop.trans_status }
    end

    assert_redirected_to transaksi_drop_path(assigns(:transaksi_drop))
  end

  test "should show transaksi_drop" do
    get :show, id: @transaksi_drop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaksi_drop
    assert_response :success
  end

  test "should update transaksi_drop" do
    patch :update, id: @transaksi_drop, transaksi_drop: { receiver_id: @transaksi_drop.receiver_id, sender_id: @transaksi_drop.sender_id, trans_status: @transaksi_drop.trans_status }
    assert_redirected_to transaksi_drop_path(assigns(:transaksi_drop))
  end

  test "should destroy transaksi_drop" do
    assert_difference('TransaksiDrop.count', -1) do
      delete :destroy, id: @transaksi_drop
    end

    assert_redirected_to transaksi_drops_path
  end
end
