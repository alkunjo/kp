class	LapaskPdf < Prawn::Document
	include ActiveSupport::NumberHelper
	def initialize(jadisatu)
		# @cek = cek
		# @sender = sender
		# @month = month
		# @year = year
		@jadisatu = jadisatu
		super(top_margin: 30)
		font_size(10) {text "#{@jadisatu}"}
		move_down 3
		header_page
		print_table
		footer_page
	end

	def header_page
		font_size(10) {text "PT. Kimia Farma Apotek"}
		move_down 3
		font_size(10) {text "#{@jadisatu}"}
		move_down 3
		font_size(10) {text "#{@jadisatu}"}
		move_down 3
		font_size(10) {text "#{@jadisatu}"}
		move_down 3
	end

	def print_table
		font_size(10) {text "Table"}
		move_down 3
		font_size(10) {text "asdasd"}
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