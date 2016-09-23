class Transaksi < ActiveRecord::Base
  self.primary_key = "transaksi_id"
  belongs_to :sender, class_name: "Outlet"
  belongs_to :receiver, class_name: "Outlet"
  has_many :dtrans
  attr_accessor :outlet_name, :sender_name, :receiver_name

  def status
  	if self.trans_status.nil?
  		return 'Belum Tervalidasi'
  	elsif self.trans_status == 1
  		return 'Permintaan Tervalidasi'
  	elsif self.trans_status == 2
  		return 'Dropping Tervalidasi'
  	elsif self.trans_status == 3
  		return 'Penerimaan Obat Selesai'
  	end
  end

  def unvalidated?
  	if self.trans_status.nil?
  		return true
  	else
  		return false
  	end
  end

  def accepted?
  	if self.trans_status == 3
  		return true
  	else
  		return false
  	end
  end

  def asked?
  	if self.trans_status == 1
  		return true
  	else
  		return false
  	end
  end

  def dropped?
  	if self.trans_status == 2
  		return true
  	else
  		return false
  	end
  end
end