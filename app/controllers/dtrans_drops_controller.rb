class DtransDropsController < ApplicationController
  before_action :set_dtrans_drop, only: [:show, :edit, :update, :destroy]
  before_action :set_transaksi_drop, only: [:index, :new, :create]

  def index
    @transaksi_drop = TransaksiDrop.find(params[:transaksi_drop_id])
    @dtrans_drops = @transaksi_drop.dtrans_drops.present?
    @dtrans_drop = @transaksi_drop.dtrans_drops.find(params[:id])
  end

  def new
    transaksi_drop = TransaksiDrop.find(params[:transaksi_drop_id])
    @dtrans_drops = transaksi_drop.dtrans_drops.present?
    
    @dtrans_drop = DtransDrop.new
  end

  def create
    @dtrans_drop = DtransDrop.new(dtrans_drop_params)

    respond_to do |format|
      if @dtrans_drop.save
        format.html { redirect_to @dtrans_drop, notice: 'Dtrans drop was successfully created.' }
        format.json { render :show, status: :created, location: @dtrans_drop }
      else
        format.html { render :new }
        format.json { render json: @dtrans_drop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dtrans_drop.destroy
    respond_to do |format|
      format.html { redirect_to dtrans_drops_url, notice: 'Dtrans drop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dtrans_drop
      @dtrans_drop = DtransDrop.find(params[:id])
    end

    def set_transaksi_ask
      @transaksi_ask = TransaksiAsk.find(params[:transaksi_ask_id])
    end

    def set_transaksi_drop
      @transaksi_drop = TransaksiDrop.find(paramsp[:transaksi_drop_id])
    end

    def set_obats
      @obats = Obat.all
    end

    def dtrans_drop_params
      params.require(:dtrans_drop).permit(:dtd_req, :dtd_qty, :dtd_rsn, :transaksi_drop_id, :obat_id, :obat_name)
    end
end
