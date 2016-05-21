class Dosage < ActiveRecord::Base
	self.primary_key = "dosage_id"
	has_many :obats
	validates_presence_of :dosage_name, message: "Nama dosis harus diisi"
	validates_presence_of :dosage_judul, message: "Judul dosis harus diisi"
	validates_uniqueness_of :dosage_name, message: "Nama dosis harus unik"
	
	#attr_accessible :dosage_name, :dosage_judul

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |dosage|
				csv << dosage.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		accessible_attributes = [:dosage_name, :dosage_judul]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    dosage = find_by_dosage_name(row["dosage_name"])
	    if dosage.blank?
	    	dosage = Dosage.create(dosage_name: row["dosage_name"], dosage_judul: row["dosage_judul"])
	    end
	    dosage.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::CSV.new(file.path, packed: false, file_warning: :ignore)
	  when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end