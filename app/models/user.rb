class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  self.primary_key = "user_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :position
  belongs_to :outlet
  validates_presence_of :user_name, :user_username
	before_save :assign_role

	def assign_role
	  self.role = Role.find_by role_name: "Pengadaan" if self.role.nil?
	end

  def admin?
    self.role.role_name == "Admin"
  end

  def not_admin?
    self.role.role_name != "Admin"
  end
  
  def manager?
    self.role.role_name == "Manager"
  end
  
  def pengadaan?
    self.role.role_name == "Pengadaan"
  end

  def gudang?
    self.role.role_name == "Gudang"
  end

  def admin_gudang?
    self.role.role_name == "Admin Gudang"
  end

  def not_admin_gudang?
    self.role.role_name != "Admin Gudang"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    accessible_attributes = [:user_name, :user_judul]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = find_by_user_name(row["user_name"])
      if user.blank?
        user = User.create(user_username: row["user_username"], user_name: row["user_name"], user_address: row["user_address"], user_phone: row["user_phone"], role_id: row["role_id"], position_id: row["position_id"], outlet_id: row["outlet_id"], email: row["email"], password: row["password"])
      end
      user.save!
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
