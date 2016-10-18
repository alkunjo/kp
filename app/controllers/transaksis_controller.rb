class TransaksisController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_transaksi, only: [:edit, :update, :destroy, :del, :show_ask, :show_drop, :show_accept, :skrip_bpba, :skrip_drop, :validate_ask, :validate_drop]
  before_action :set_transaksi_ask, only: [:index, :show_a]
  before_action :set_transaksi_drop, only: [:index, :show_d]
  before_action :set_transaksis, only: [:ask, :drop, :accept, :new, :create]
  autocomplete :outlet, :outlet_name, full: true

  def index
  	path = case current_user.role
  		when 'Pengadaan'
  			ask_transaksis_path
  		when 'Gudang', 'Admin Gudang'
  			drop_transaksis_path
  		when 'Manager', 'Admin'
  			report_ask_transaksis_path
  		else
  			ask_transaksis_path
  	end

  	redirect_to path
    # @transaksi = Transaksi.new
  end


  # ini buat index permintaan, dropping dan penerimaan obat
  def ask
    @transaksi = Transaksi.new
  end

  def drop
  	
  end

  def accept
  	if params[:id].present?
  		@transaksi = Transaksi.find(params[:id])
  	end
  end
  # ini buat index permintaan, dropping dan penerimaan obat


  # ini digunakan untuk nampilin modal detail transaksi per fungsi permintaan, dropping dan penerimaan obat
  def show_ask
    respond_to do |format|
      format.js {render "show_ask"}
    end
  end

  def show_drop
    respond_to do |format|
      format.js {render "show_drop"}
    end
  end  

  def show_accept
    respond_to do |format|
      format.js {render "show_accept"}
    end
  end
  # ini digunakan untuk nampilin modal detail transaksi per fungsi permintaan, dropping dan penerimaan obat


  # ini digunakan untuk build report view
  def report_ask
    
  end

  def report_drop
      
  end
  # ini digunakan untuk build report view


  # ini buat generate pdf report
  def print_report_ask
    
  end

  def print_report_drop
    
  end
  # ini buat generate pdf report


  # ini buat generate simple form buat report
  def report_ask_view
    
  end

  def report_drop_view
    
  end
  # ini buat generate simple form buat report


  # ini digunakan untuk nyetak skrip per fungsi 
  def skrip_bpba
  	@transaksi = Transaksi.find(params[:id])
    sender = @transaksi.sender_id.to_s
    if sender.length == 1
      sender = '0'+sender
    end

    receiver = @transaksi.receiver_id.to_s
    if receiver.length == 1
      receiver = '0'+receiver
    end
    respond_to do |format|
      format.pdf do 
        pdf = BpbaPdf.new(@transaksi)
        # pdf = Prawn::Document.new
        send_data pdf.render, filename: "B#{sender}#{receiver}#{@transaksi.created_at.strftime("%d%m%Y")}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def skrip_drop
    @transaksi = Transaksi.find(params[:id])
    sender = @transaksi.sender_id.to_s
    if sender.length == 1
      sender = '0'+sender
    end

    receiver = @transaksi.receiver_id.to_s
    if receiver.length == 1
      receiver = '0'+receiver
    end
    respond_to do |format|
      format.pdf do
        pdf = DropPdf.new(@transaksi)
        send_data pdf.render, filename: "D#{sender}#{receiver}#{@transaksi.dropped_at.strftime("%d%m%Y")}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def skrip_accept
  	@transaksi = Transaksi.find(params[:id])
    sender = @transaksi.sender_id.to_s
    if sender.length == 1
      sender = '0'+sender
    end

    receiver = @transaksi.receiver_id.to_s
    if receiver.length == 1
      receiver = '0'+receiver
    end
    respond_to do |format|
      format.pdf do
        pdf = AcceptPdf.new(@transaksi)
        send_data pdf.render, filename: "T#{sender}#{receiver}#{@transaksi.accepted_at.strftime("%d%m%Y")}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end
  # ini digunakan untuk nyetak skrip per fungsi 


  # ini digunakan untuk memvalidasi fungsi (update status transaksi aja sebenernya)
  def validate_ask
    if @transaksi.dtrans.exists?
      penerima = Outlet.find(@transaksi.receiver_id)      
      @transaksi.update_attributes(:trans_status => 1, :asked_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
      @transaksi.create_activity action: 'validate_ask', owner: current_user, recipient: penerima
      respond_to do |format|
        return new
      end
    end
  end

  def validate_drop
    @transaksi.update_attributes(:trans_status => 2, :dropped_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    if @transaksi
      penerima = Outlet.find(@transaksi.sender_id)
      @transaksi.create_activity action: 'validate_drop', owner: current_user, recipient: penerima
      @dtrans = @transaksi.dtrans
      @dtrans.each do |dtran|
        # update stok
        stok = Stock.where(outlet_id: current_user.outlet_id).where(obat_id: dtran.obat_id).first
        minta = dtran.dtd_qty.nil? ? 0 : dtran.dtd_qty
        hasil = stok.stok_qty - minta
        stok.update_attribute(:stok_qty, hasil)
        if dtran.dtd_qty.nil? 
          dtran.update_attribute(:dtd_qty, 0)
        end
      end
      respond_to do |format|
        flash.now[:success] = "Validasi Dropping berhasil dilakukan"
        format.js {render "show_drop"}
      end
    else
      respond_to do |format|
        flash.now[:danger] = "Maaf ada kesalahan query. Coba lagi"
        format.js {render "warn"}
      end
    end
  end

  def validate_accept
    @tran = Transaksi.find(params[:id])
    @tran.update_attributes(:trans_status => 3, :accepted_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    if @tran
      penerima = Outlet.find(@tran.receiver_id)
      @tran.create_activity action: 'validate_accept', owner: current_user, recipient: penerima
      @dtrans = @tran.dtrans
      @dtrans.each do |dtran|
        @stok = Stock.where(outlet_id: @tran.sender_id, obat_id: dtran.obat_id).first
        trima = dtran.dtt_qty.present? ? dtran.dtt_qty : 0        
        stok = @stok.stok_qty + trima
        @stok.update_attributes(:stok_qty => stok, :updated_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
      end
    end
    flash[:success] = "Stok berhasil ditambahkan"
    redirect_to stocks_url
  end
  # ini digunakan untuk memvalidasi fungsi (update status transaksi aja sebenernya)


  # ini dibuat untuk dapetin transaksi dari simple form
  def get_accept
    
    # substring nomor BPBA
    @sid = params[:obat_in][1..2]
    @rid = params[:obat_in][3..4]
    @tgl_day = params[:obat_in][5..6]
    @tgl_bln = params[:obat_in][7..8]
    @tgl_yrs = params[:obat_in][9..12]

    # respond_to do |format|
    #   format.js {render 'alert'}
    # end
    @tran = Transaksi.where(sender_id: @sid, receiver_id: @rid).first
    @dtrans = @tran.dtrans

    @dtrans.each do |dtran|
      if dtran.dtt_qty.nil?
        if dtran.dtd_qty.nil?
          dtran.update_attribute(:dtd_qty, 0) 
          dtran.update_attribute(:dtt_qty, 0) 
        else
          dtran.update_attribute(:dtt_qty, dtran.dtd_qty)
        end
      end
    end

    respond_to do |format|
      format.js {render 'trans'}
    end
  end
  # ini dibuat untuk dapetin transaksi dari simple form


  # ini digunakan untuk konfirmasi validasi dropping aja
  def valdrop
    cek = Dtran.where(dtd_qty: nil).where(transaksi_id: params[:id]).count
    total = Dtran.where(transaksi_id: params[:id]).count
    @transaksi = Transaksi.find(params[:id])
    if cek == 0
      flash.now[:danger] = "#{total} permintaan telah terisi. "
    else
      flash.now[:danger] = "#{cek} permintaan belum terisi dari #{total} permintaan. "
    end
    
    respond_to do |format|
      format.js {render 'valdrop'}
    end
  end
  # ini digunakan untuk konfirmasi validasi dropping aja


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
          format.js { render 'ask' }
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
          format.js { render 'ask' }
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
        @transaksis = Transaksi.where(receiver_id: current_user.outlet_id).where(trans_status: [1,2,3])
      end          
    end

    def transaksi_params
      params.require(:transaksi).permit(:trans_status, :sender_id, :receiver_id, :sender_name, :receiver_name, :outlet_name)
    end
end