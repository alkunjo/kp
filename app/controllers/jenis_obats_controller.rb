class JenisObatsController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_jobat, only: [:del, :destroy]
  before_action :set_jobats, only: [:create, :destroy, :new, :index]
  
  def index
    @jobat = JenisObat.new
  end

  def new
    @jobat = JenisObat.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @jobat = JenisObat.new(jobat_params)
    respond_to do |format|
      if @jobat.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @jobat.destroy
        return new
      end
    end
  end

  private
    def set_jobat
      @jobat = JenisObat.find(params[:id])
    end

    def set_jobats
      @jobats = JenisObat.all
    end

    def jobat_params
      params.require(:jenis_obat).permit(:jobat_name)
    end
end