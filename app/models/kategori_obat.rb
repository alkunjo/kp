class KategoriObat < ActiveRecord::Base
	self.primary_key = 'kobat_id'
	has_many :obats
	validates_presence_of :kobat_name, message: "Nama kategori harus diisi"
	validates_uniqueness_of :kobat_name, message: "Nama kategori harus unik"
	
	#attr_accessible :kobat_name, :kobat_judul

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |kobat|
				csv << kobat.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		accessible_attributes = [:kobat_name]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    kobat = find_by_kobat_name(row["kobat_name"])
	    if kobat.blank?
	    	kobat = KategoriObat.create(kobat_name: row["kobat_name"])
	    end
	    kobat.save!
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
