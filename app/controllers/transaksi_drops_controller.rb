class TransaksiDropsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_transaksi_drop, only: [:show, :edit, :update, :destroy]
  before_action :set_transaksi_drops, only: [:index]
  before_action :set_index, only: [:index]
  before_action :set_transaksi_asks, only: [:index, :new]
  autocomplete :outlet, :outlet_name, full: true

  def index
  end

  def show
  end

  def new
    transaksi_ask = @transaksi_asks.find(params[:transaksi_ask])
    @transaksi_drop = TransaksiDrop.create(sender_id: current_user.outlet_id, receiver_id: transaksi_ask.sender_id)
    if @transaksi_drop
      @dtrans_asks = transaksi_ask.dtrans_asks
      @dtrans_asks.each do |dtrans_ask|
        @dtrans_drop = DtransDrop.create(transaksi_drop_id: @transaksi_drop.transdrop_id, dtd_req: dtrans_ask.dta_qty, obat_id: dtrans_ask.obat_id)
      end
      if @dtrans_asks
        redirect_to transaksi_drops_path, notice: 'Transaksi Dropping Obat berhasil dibuat'
      end
    else
      respond_to do |format|
        render "new"
      end
    end
  end

  def destroy
    @transaksi_drop.destroy
    respond_to do |format|
      format.html { redirect_to transaksi_drops_url, notice: 'Transaksi drop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def del
  end

  def validate
  end

  private
    def set_transaksi_drop
      @transaksi_drop = TransaksiDrop.find(params[:id])
    end

    def set_transaksi_drops
      if current_user.admin?
        @transaksi_drops = TransaksiDrop.all
      else
        @transaksi_drops = TransaksiDrop.where(sender_id: current_user.outlet_id)
      end
    end

    def set_transaksi_asks
      @transaksi_asks = TransaksiAsk.where(receiver_id: current_user.outlet_id)
    end

    def set_transaksi_ask
      @transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])
    end

    def set_index
      @trans = TransaksiAsk.where(receiver_id: current_user.outlet_id) or TransaksiDrop.all
    end

    def transaksi_drop_params
      params.require(:transaksi_drop).permit(:trans_status, :sender_id, :receiver_id, :outlet_id, :outlet_name, :transaksi_ask, :transaksi_ask_id)
    end
end
