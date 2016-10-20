module TransaksisHelper
	def to_rupiah(fill)
		number_to_currency( fill, unit: "Rp. ", separator: ',', delimeter: '.' )
	end

	def total_minta(cek)
		total = 0
		cek.dtrans.each do |dtran|
			hargaObat = Obat.find(dtran.obat_id).obat_hpp * dtran.dta_qty
			total = total + hargaObat
		end
		return total
	end

	def apotek(cek)
		apotek = Outlet.find(cek.receiver_id).outlet_name
		return apotek
	end
end
