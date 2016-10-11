class DashboardController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		if current_user.admin?
      @activities = PublicActivity::Activity.all
    elsif current_user.pengadaan?
      @activities = PublicActivity::Activity.where(owner: current_user.user_id)
    elsif current_user.gudang? || current_user.admin_gudang? || current_user.manager?
      @activities = PublicActivity::Activity.where(recipient_id: current_user.outlet_id)
    end 
	end

end