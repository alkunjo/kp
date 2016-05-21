class KategoriObatsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_kobat, only: [:del, :destroy]
  before_action :set_kobats, only: [:new, :create, :destroy, :index]
  
  def index
    @kobat = KategoriObat.new
  end

  def new
    @kobat = KategoriObat.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @kobat = KategoriObat.new(kobat_params)
    respond_to do |format|
      if @kobat.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @kobat.destroy
        return new
      end
    end
  end

  private
    def set_kobat
      @kobat = KategoriObat.find(params[:id])
    end

    def set_kobats
      @kobats = KategoriObat.all
    end

    def kobat_params
      params.require(:kategori_obat).permit(:kobat_name)
    end
end
