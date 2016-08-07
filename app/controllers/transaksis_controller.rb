class TransaksisController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_transaksi, only: [:show_a, :show_d, :edit, :update, :destroy, :del, :validate_a, :validate_d, :valdrop, :bpba, :drop]
  before_action :set_transaksi_ask, only: [:index, :show_a]
  before_action :set_transaksi_drop, only: [:index, :show_d]
  before_action :set_transaksis, only: [:index, :new, :create, :index_ask, :index_drop]
  autocomplete :outlet, :outlet_name, full: true

  def index
    @transaksi = Transaksi.new
  end

  def show_a
    respond_to do |format|
      format.js {render "show_a"}
    end
  end

  def show_d
    #@transaksi = Transaksi.find(params[:id])
    respond_to do |format|
      format.js {render "show_d"}
    end
  end

  def bpba
    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.generate("bpba_#{@transaksi.transaksi_id}.pdf")
        pdf.text "Halooooo"
      end
    end
  end

  def drop
    
  end

  def new
    set_transaksis
    @transaksi = Transaksi.new
    respond_to do |format|
      format.js {render "new"}
    end
  end

  def edit
  end

  def create
    @transaksi = Transaksi.new(transaksi_params)
    cek = Transaksi.where(receiver_id: @transaksi.receiver_id).where(trans_status: 2)
    if cek #sudah tervalidasi dropping      
      receiver = Outlet.find_by(outlet_name: @transaksi.outlet_name)
      if receiver.nil?
        flash.now[:notice] = 'Nama outlet harus diisi.'
        #flash.keep(:notice)
        respond_to do |format|
          format.js { render 'index' }
        end 
        
      elsif current_user.pengadaan?
        @transaksi = Transaksi.create(sender_id: current_user.outlet_id, receiver_id: receiver.outlet_id)
        respond_to do |format|
          if @transaksi
            return new
          end
        end
      else
        flash.now[:notice] = 'Maaf Gudang tidak bisa membuat permintaan.'
        #flash.keep(:notice)
        respond_to do |format|
          format.js { render 'index' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @transaksis, notice: 'Transaksi sebelumnya belum dikonfirmasi dropping.' }
      end
    end
  end

  def update
  end

  def del
  end

  def destroy
    @transaksi.destroy
    respond_to do |format|
      return new
    end
  end

  def validate_a
    if @transaksi.dtrans.present?
      @transaksi.update_attribute(:trans_status, 1)
      respond_to do |format|
        return new
      end
    end
  end

  def validate_d
    @transaksi.update_attributes(:trans_status => 2, :dropped_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    if @transaksi
      @dtrans = @transaksi.dtrans
      @dtrans.each do |dtran|
        # update stok
        stok = Stock.where(outlet_id: current_user.outlet_id).where(obat_id: dtran.obat_id).first
        minta = dtran.dtd_qty.nil? ? 0 : dtran.dtd_qty
        hasil = stok.stok_qty - minta
        stok.update_attribute(:stok_qty, hasil)
      end
      respond_to do |format|
        flash.now[:success] = "Validasi Dropping berhasil dilakukan"
        format.js {render "show_d"}
      end
    else
      respond_to do |format|
        flash.now[:danger] = "Maaf ada kesalahan query. Coba lagi"
        format.js {render "warn"}
      end
    end
  end

  def valdrop
    cek = @transaksi.dtrans.where(dtd_qty: nil).count
    total = @transaksi.dtrans.count
    flash.now[:danger] = "#{cek} permintaan belum terisi dari #{total} permintaan. "
    respond_to do |format|
      format.js {render 'valdrop'}
    end
  end

  def get_autocomplete_items(parameters)
    items = active_record_get_autocomplete_items(parameters)
    items = items.where.not(outlet_id: current_user.outlet_id)
  end

  private
    def set_transaksi
      @transaksi = Transaksi.find(params[:id])
    end

    def set_outlet
      @outlet = Outlet.where(outlet_id: current_user.outlet_id).first
    end

    def set_transaksis
      if current_user.admin?
        @transaksis = Transaksi.all
      elsif current_user.pengadaan?
        @transaksis = Transaksi.where(sender_id: current_user.outlet_id)
      elsif current_user.gudang?
        @transaksis = Transaksi.where(receiver_id: current_user.outlet_id).where(trans_status: [1,2])
      end          
    end

    def set_transaksi_ask
      @trans_asks = Transaksi.where(sender_id: current_user.outlet_id)
    end

    def set_transaksi_drop
      @trans_drops = Transaksi.where(receiver_id: current_user.outlet_id).where(trans_status: 1)
    end

    def transaksi_params
      params.require(:transaksi).permit(:trans_status, :sender_id, :receiver_id, :sender_name, :receiver_name, :outlet_name)
    end

end
