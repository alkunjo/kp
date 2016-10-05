class BpbaPdf < Prawn::Document
	def initialize(transaksi)
		super(top_margin: 30)
		@transaksi = transaksi
		header_page
		print_table
	end

	def header_page
		sender = Outlet.find(@transaksi.sender_id)
		receiver = Outlet.find(@transaksi.receiver_id)
		font_size(10) {text "PT. Kimia Farma Apotek"}
		move_down 3
		font_size(10) {text "Apotek #{sender.outlet_name}"}
		move_down 15
		font_size(13) {text "BON PERMINTAAN BARANG APOTIK", align: :center, style: :bold}
		move_down 3
		font_size(12) {text "Ke Apotik: #{receiver.outlet_name}", align: :center}
		move_down 3
		font_size(12) {text "Nomor BPBA: #{@transaksi.sender_id}#{@transaksi.receiver_id}#{@transaksi.created_at.strftime("%d%m%Y")}", align: :center}
		move_down 3
		font_size(12) {text "Tanggal   : #{@transaksi.created_at.strftime("%d/%m/%Y")}", align: :center}
		move_down 10
	end

	def print_table
		table table_bpba do
			row(0).font_style = :bold
			columns(0..1).align = :center
			self.row_colors = ["CDFFFF", "FFFFFF"]
			self.header = true
			self.position = :center
		end
		move_down 15
	end

	def table_bpba
		numb = 0
		[["No.","Nama Obat", "Jumlah", "Kemasan", "Hrg Satuan", "Jml Permintaan"]]+
		@transaksi.dtrans.map do |dtran|
			numb = numb + 1
			[numb, 
			 Obat.find(dtran.obat_id).obat_name, 
			 dtran.dta_qty,
			 "#{Kemasan.find(Obat.find(dtran.obat_id).kemasan_id).kemasan_vol.to_s} #{Kemasan.find(Obat.find(dtran.obat_id).kemasan_id).kemasan_unit}",
			 number_to_currency(Obat.find(dtran.obat_id).obat_hpp),
			 (dtran.dta_qty*Obat.find(dtran.obat_id).obat_hpp)]
		end
	end

	def footer_page
		
	end
end