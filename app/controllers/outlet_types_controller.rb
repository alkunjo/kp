class OutletTypesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_otype, only: [:del, :destroy]
  before_action :set_otypes, only: [:index, :create, :destroy, :new]
  
  def index
    @otype = OutletType.new
  end

  def new
    @otype = OutletType.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @otype = OutletType.new(otype_params)
    respond_to do |format|
      if @otype.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @otype.destroy
        return new
      end
    end
  end

  private
    def set_otype
      @otype = OutletType.find(params[:id])
    end

    def set_otypes
      @otypes = OutletType.all
    end

    def otype_params
      params.require(:outlet_type).permit(:otype_name)
    end
end
