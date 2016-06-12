class GrupObatsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_gobat, only: [:del, :destroy]
  before_action :set_gobats, only: [:create, :destroy, :new, :index]
  
  def index
    @gobat = GrupObat.new
  end

  def new
    @gobat = GrupObat.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @gobat = GrupObat.new(gobat_params)

    respond_to do |format|
      if @gobat.save
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @gobat.update(gobat_params)
        return new
      else
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @gobat.destroy
        return new
      end
    end
  end

  def import
    GrupObat.import(params[:file])
    redirect_to grup_obats_path, notice: "Grup Obat imported."
  end

  private
    def set_gobat
      @gobat = GrupObat.find(params[:id])
    end

    def set_gobats
      @gobats = GrupObat.paginate(:page => params[:page], :per_page => 10)
    end

    def gobat_params
      params.require(:grup_obat).permit(:gobat_name, :gobat_judul)
    end
end
