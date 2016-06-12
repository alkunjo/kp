class DosagesController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_dosage, only: [:edit, :update, :del, :destroy]
  before_action :set_dosages, only: [:create, :update, :destroy, :new, :index]
  
  def index
    @dosage = Dosage.new
    respond_to do |format|
      format.html
      format.csv
    end
  end

  def new
    @dosage = Dosage.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
  end

  def del    
  end

  def create
    @dosage = Dosage.new(dosage_params)
    respond_to do |format|
      if @dosage.save
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @dosage.update(dosage_params)
        return new
      else
        format.js { render 'edit' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @dosage.destroy
        return new
      end
    end
  end

  def import
    Dosage.import(params[:file])
    redirect_to dosages_path, notice: "Dosages imported."
  end

  private
    def set_dosage
      @dosage = Dosage.find(params[:id])
    end

    def set_dosages
      @dosages = Dosage.paginate(:page => params[:page], :per_page => 10)
    end

    def dosage_params
      params.require(:dosage).permit(:dosage_name, :dosage_judul)
    end
end