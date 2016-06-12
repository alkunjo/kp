class Generik < ActiveRecord::Base
	self.primary_key = "generik_id"
	has_many :obats
	validates_presence_of :generik_name, message: "Nama generik harus diisi"
	validates_uniqueness_of :generik_name

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |generik|
				csv << generik.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		accessible_attributes = [:generik_name]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    generik = find_by_generik_name(row["generik_name"])
	    if generik.blank?
	    	generik = Generik.create(generik_name: row["generik_name"])
	    end
	    generik.save!
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
