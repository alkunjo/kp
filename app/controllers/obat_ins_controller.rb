class ObatInsController < ApplicationController
	before_filter :authenticate_user!
	if @transaksi.present?
		before_action :set_transaksi, only: [:index, :edit, :accept]
	end
	
	before_action :set_obats, only: [:index]

	def index
		# if params[:obat_in].present?
		# 	@transaksi = Transaksi.find(params[:obat_in])
		# 	@dtrans = @transaksi.dtrans
		# end
	end

	def edit
		# @transaksi = Transaksi.find(params[:obat_in])
		@dtran = Dtran.find(params[:id])
		respond_to do |format|
			format.js {render "edit"}
		end
	end

	def update
		@dtran = Dtran.find(params[:id])
		@tran = Transaksi.find(@dtran.transaksi_id)
		@dtrans = @tran.dtrans

		if @dtran.update_column(:dtt_qty, params[:dtran][:dtt_qty])
			respond_to do |format|
				format.js {render "trans"}
			end
		end
	end

	def ganti
		# @dtran = Dtran.find(params[:id])

		# if @dtran.update_column(:dtt_qty, params[:dtran][:dtt_qty])
		# 	respond_to do |format|
		# 		format.js {render "save"}
		# 	end
		# end
		
		# @tran = Transaksi.find(params[:id])
		# @tran.update_attributes(:trans_status => 3, :accepted_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"))
		# if @tran
		# 	@dtrans = @tran.dtrans
		# 	@dtrans.each do |dtran|
		# 		@stok = Stock.where(outlet_id: @tran.sender_id, obat_id: dtran.obat_id).first
		# 		stok = @stok.stok_qty + dtran.dtt_qty
		# 		@stok.update_column(:stok_qty, stok)
		# 	end
		# 	respond_to do |format|
		# 		format.js {render "accept"}
		# 	end
		# end
	end

	def kirim
		@tran = Transaksi.find(params[:obat_in])
		@dtrans = @tran.dtrans

		@dtrans.each do	|dtran|
			if dtran.dtt_qty.nil?
				if dtran.dtd_qty.nil?
					dtran.dtt_qty = 0	
				else
					dtran.dtt_qty = dtran.dtd_qty
				end
			end
		end

		respond_to do |format|
			format.js {render 'trans'}
		end
	end

	def trimo
		@tran = Transaksi.find(params[:id])
		respond_to do |format|
			if @tran
				format.js {render 'terima'}	
			end
		end
	end

	private
	def set_transaksi
		@transaksi = Transaksi.find(params[:id])
	end

	def set_obats
		@obats = Obat.where(outlet_id: current_user.outlet_id)
	end

	def obat_in_params
		params.require(:obat_in).permit(:transaksi_id, :obat_in, :dtt_qty, :dtd_qty)
	end

	def dtran_params
		params.require(:dtran).permit(:transaksi_id, :dtt_qty, :dtd_qty)
	end

end
