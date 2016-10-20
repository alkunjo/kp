class	LapaskPdf < Prawn::Document
	include ActiveSupport::NumberHelper
	def initialize(cek)
		super(top_margin: 30)
		@cek = cek
		header_page
		print_table
		footer_page
	end

	def header_page
		sender = @cek.sender_id
		outlet = Outlet.find()
		font_size(10) {text "PT. Kimia Farma Apotek"}
		move_down 3
	end

	def print_table
		font_size(10) {text "Table"}
		move_down 3
	end

	def table_accept
		
	end

	def footer_page
		
	end

	private
	def to_rupiah(fill)
		number_to_currency( fill, unit: "Rp. ", separator: ',', delimeter: '.' )
	end
end