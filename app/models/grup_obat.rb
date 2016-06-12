class GrupObat < ActiveRecord::Base
	self.primary_key = "gobat_id"
	has_many :obats
	validates_presence_of :gobat_name, message: "Nama grup obat harus diisi"
	validates_uniqueness_of :gobat_name, message: "Nama grup obat harus unik"
	
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |gobat|
				csv << gobat.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		accessible_attributes = [:gobat_name, :gobat_judul]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    gobat = find_by_gobat_name(row["gobat_name"])
	    if gobat.blank?
	    	gobat = GrupObat.create(gobat_name: row["gobat_name"])
	    end
	    gobat.save!
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
