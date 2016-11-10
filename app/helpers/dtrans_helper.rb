module DtransHelper
	def getKemasan(obat_id)
  	kemasan = Obat.find(obat_id).kemasan_id
  	kemasan_name = Kemasan.find(kemasan).kemasan_unit
  	return kemasan_name
  end
  
  def getIsi(obat_id)
  	kemasan = Obat.find(obat_id).kemasan_id
  	kemasan_name = Kemasan.find(kemasan).kemasan_cap
  	return kemasan_name
  end
end
