class	AcceptPdf < Prawn::Document
	include ActiveSupport::NumberHelper
	def initialize(transaksi)
		super(top_margin: 30)
		@transaksi = transaksi
		header_page
		print_table
		footer_page
	end

	def header_page
		sender = Outlet.find(@transaksi.sender_id)
		receiver = Outlet.find(@transaksi.receiver_id)		
		font_size(13) {text "BUKTI PENERIMAAN BARANG", align: :center, style: :bold}
		move_down 20
		font_size(12) {text "Terima dari: Apotek #{receiver.outlet_name}", align: :center}
		move_down 3
		font_size(12) {text "Nomor BPBA: B#{@transaksi.sender_id}#{@transaksi.receiver_id}#{@transaksi.created_at.strftime("%d%m%Y")}   Nomor Penerimaan: T#{@transaksi.sender_id}#{@transaksi.receiver_id}#{@transaksi.accepted_at.strftime("%d%m%Y")}", align: :center}
		move_down 3
		font_size(12) {text "Tanggal   : #{@transaksi.accepted_at.strftime("%d/%m/%Y")}", align: :center}
		move_down 10
	end

	def print_table
		table table_accept do
			row(0).font_style = :bold
			columns(0..1).align = :center
			self.row_colors = ["CDFFFF", "FFFFFF"]
			self.header = true
			self.position = :center
		end
		move_down 30
	end

	def table_accept
		numb = 0
		total = 0
		[["No.","Nama Obat", "Jml Terima", "Kemasan", "Hrg Satuan", "Total Harga"]]+
		@transaksi.dtrans.map do |dtran|
			numb = numb + 1
			total = total + dtran.dtt_qty*Obat.find(dtran.obat_id).obat_hpp
			[numb, 
			 Obat.find(dtran.obat_id).obat_name, 
			 dtran.dtt_qty,
			 "#{Kemasan.find(Obat.find(dtran.obat_id).kemasan_id).kemasan_vol.to_s} #{Kemasan.find(Obat.find(dtran.obat_id).kemasan_id).kemasan_unit}",
			 to_rupiah(Obat.find(dtran.obat_id).obat_hpp),
			 to_rupiah(dtran.dtt_qty*Obat.find(dtran.obat_id).obat_hpp)]
		end+
		[[{:content => "Total", :colspan => 5},to_rupiah(total)]]

	end

	def footer_page
		ttd = [["Penerima Barang", "PJ Gudang", "Pimpinan APP"],["","",""]]
		table ttd do
			row(0).font_style = :bold
			row(1).height = 60
			self.header = true
			self.position = :center
		end
	end

	private
	def to_rupiah(fill)
		number_to_currency( fill, unit: "Rp. ", separator: ',', delimeter: '.' )
	end
end