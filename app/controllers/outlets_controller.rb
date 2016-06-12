class OutletsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_outlet, only: [:del, :destroy, :edit, :update]
  before_action :set_outlets, only: [:index, :create, :destroy, :edit, :update, :new]
  before_action :set_otypes, only: [:new, :create, :edit, :update, :index]
  autocomplete :outlet, :outlet_name, full: true
  def index
    @outlet = Outlet.new
  end

  def new
    @outlet = Outlet.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit    
  end

  def del    
  end

  def create
    @outlet = Outlet.new(outlet_params)

    respond_to do |format|
      if @outlet.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @outlet.destroy
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @outlet.update(outlet_params)
        return new
      else  
        format.js { render 'edit' }
      end
    end
  end

  private
    def set_outlet
      @outlet = Outlet.find(params[:id])
    end

    def set_outlets
      @outlets = Outlet.paginate(:page => params[:page], :per_page => 7)
    end

    def set_otypes
      @otypes = OutletType.all
    end

    def outlet_params
      params.require(:outlet).permit(:outlet_name, :outlet_type_id, :outlet_address, :outlet_phone, :outlet_city, :outlet_email, :outlet_fax)
    end
end
