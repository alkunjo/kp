class DtransAsksController < ApplicationController
  before_action :set_dtrans_ask, only: [:show, :edit, :update, :destroy]
  before_action :set_transaksi_ask, only: [:index, :new, :edit, :create, :update, :destroy]
  
  def index
    @dtrans_asks = @transaksi_ask.dtrans_asks.present?
  end

  def new
    @transaksi_ask = TransaksiAsk.find_by_id(params[:transask_id])
    @dtrans_ask = @transaksi_ask.dtrans_asks.build
    @obats = Obat.all
    respond_to do |format|
      format.js {render action: "new"}
    end
  end

  def edit
  end

  def create
    @dtrans_ask = @transaksi_ask.dtrans_asks.create(dtrans_ask_params)

    respond_to do |format|
      if @dtrans_ask.save
        format.js {render action: "save"}
      else
        format.js {render action: "new"}
      end
    end
  end

  def update
    respond_to do |format|
      if @dtrans_ask.update(dtrans_ask_params)
        return new
      end
    end
  end

  def destroy
    @dtrans_ask = @transaksi_ask.dtrans_asks.find(params[:id])
    @dtrans_ask.destroy
    respond_to do |format|
      format.js {render action: "save"}
    end
  end

  private
    def set_dtrans_ask
      @dtrans_ask = DtransAsk.find(params[:id])
    end

    def set_transaksi_ask
      @transaksi_ask = TransaksiAsk.find(params[:transask_id])
    end

    def dtrans_ask_params
      params.require(:dtrans_ask).permit(:dta_qty, :transaksi_ask_id, :obat_id)
    end
end
