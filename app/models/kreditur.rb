class Kreditur < ActiveRecord::Base
	self.primary_key = "kreditur_id"
	has_many :kreditur_pabriks
	validates_presence_of :kreditur_name, message: "Nama kreditur harus diisi"
	validates_presence_of :kreditur_address, message: "Alamat kreditur harus diisi"
	
	#attr_accessible :kreditur_name, :kreditur_judul

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |kreditur|
				csv << kreditur.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		accessible_attributes = [:kreditur_name, :kreditur_address]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    kreditur = find_by_kreditur_name(row["kreditur_name"])
	    if kreditur.blank?
	    	kreditur = Kreditur.create(kreditur_name: row["kreditur_name"], kreditur_address: row["kreditur_address"], kreditur_phone: row["kreditur_phone"], kreditur_fax: row["kreditur_fax"], kreditur_email: row["kreditur_email"])
	    end
	    kreditur.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::CSV.new(file.path, packed: false, file_warning: :ignore)
	  when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
	  else raise "Tipe file tidak dikenal: #{file.original_filename}"
	  end
	end
end
