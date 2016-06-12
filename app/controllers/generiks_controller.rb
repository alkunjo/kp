class GeneriksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_generik, only: [:del, :destroy]
  before_action :set_generiks, only: [:index, :create, :destroy, :new]
  
  def index
    @generik = Generik.new
  end

  def new
    @generik = Generik.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @generik = Generik.new(generik_params)
    respond_to do |format|
      if @generik.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @generik.destroy
        return new
      end
    end
  end

  def import
    Generik.import(params[:file])
    redirect_to generiks_path, notice: "Generik imported."
  end

  private
    def set_generik
      @generik = Generik.find(params[:id])
    end

    def set_generiks
      @generiks = Generik.paginate(:page => params[:page], :per_page => 10)
    end

    def generik_params
      params.require(:generik).permit(:generik_name)
    end
end
