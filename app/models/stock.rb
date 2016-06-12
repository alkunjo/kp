class Stock < ActiveRecord::Base
  self.primary_key = :stock_id
  belongs_to :outlet
  belongs_to :obat
  attr_accessor :outlet_name, :obat_name

  def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |stock|
				csv << stock.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		accessible_attributes = [:outlet_id, :obat_id, :stok_qty]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    stock = find_by(outlet_id: row["outlet_id"], obat_id: row["obat_id"])
	    if stock.blank?
	    	stock = Stock.create(stok_qty: row["stok_qty"], outlet_id: row["outlet_id"], obat_id: row["obat_id"])
	    end
	    stock.save!
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