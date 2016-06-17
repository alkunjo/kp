class DtransAsksController < ApplicationController
  before_action :set_transaksi_ask, only: [:index, :new, :create, :destroy]
  before_action :set_obats, only: [:index, :new]
  autocomplete :obat, :obat_name, full: true

  def index
    @transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])
    @dtrans_asks = @transaksi_ask.dtrans_asks.present?
    @dtrans_ask = @transaksi_ask.dtrans_asks.find(params[:id])
  end

  def new
    transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])
    @dtrans_asks = transaksi_ask.dtrans_asks.present?
    @dtrans_ask = transaksi_ask.dtrans_asks.build

    respond_to do |format|
      format.js {render action: 'new'}
    end
  end

  def create
    dtrans_ask = DtransAsk.new(dtrans_ask_params)
    transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])
    obat = Obat.find_by_obat_name(dtrans_ask.obat_name)
    @dtrans_ask = transaksi_ask.dtrans_asks.create(dta_qty: dtrans_ask.dta_qty, obat_id: obat.obat_id, transaksi_ask_id: transaksi_ask.transask_id)

    respond_to do |format|
      if @dtrans_ask.save
        format.js {render "save"}
      else 
        format.js {render "new" }
      end
    end
  end

  def destroy
    transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])
    @dtrans_ask = transaksi_ask.dtrans_asks.find(params[:id])
    @dtrans_ask.destroy
    respond_to do |format|
      format.js {render "save"}
    end
  end

  private
    def set_transaksi_ask
      @transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])  
    end

    def set_dtrans_ask
      @dtrans_ask = DtransAsk.find(params[:id])
    end

    def set_obats
      @obats = Obat.all
    end

    def dtrans_ask_params
      params.require(:dtrans_ask).permit(:dta_qty, :transaksi_ask_id, :obat_id, :obat_name)
    end
end
