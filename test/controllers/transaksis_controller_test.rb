require 'test_helper'

class TransaksisControllerTest < ActionController::TestCase
  setup do
    @transaksi = transaksis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaksis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaksi" do
    assert_difference('Transaksi.count') do
      post :create, transaksi: { receiver_id: @transaksi.receiver_id, sender_id: @transaksi.sender_id, trans_status: @transaksi.trans_status }
    end

    assert_redirected_to transaksi_path(assigns(:transaksi))
  end

  test "should show transaksi" do
    get :show, id: @transaksi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaksi
    assert_response :success
  end

  test "should update transaksi" do
    patch :update, id: @transaksi, transaksi: { receiver_id: @transaksi.receiver_id, sender_id: @transaksi.sender_id, trans_status: @transaksi.trans_status }
    assert_redirected_to transaksi_path(assigns(:transaksi))
  end

  test "should destroy transaksi" do
    assert_difference('Transaksi.count', -1) do
      delete :destroy, id: @transaksi
    end

    assert_redirected_to transaksis_path
  end
end
