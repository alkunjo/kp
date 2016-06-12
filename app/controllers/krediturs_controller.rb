class KreditursController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_kreditur, only: [:del, :destroy, :edit, :update]
  before_action :set_krediturs, only: [:index, :create, :destroy, :update, :new]
  
  def index
    @kreditur = Kreditur.new
  end

  def new
    @kreditur = Kreditur.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit    
  end

  def del    
  end

  def create
    @kreditur = Kreditur.new(kreditur_params)
    respond_to do |format|
      if @kreditur.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @kreditur.destroy
        return new
      end
    end
  end

  def import
    Kreditur.import(params[:file])
    redirect_to krediturs_path, notice: "Kreditur imported."
  end

  def update
    respond_to do |format|
      if @kreditur.update(kreditur_params)
        return new
      else  
        format.js { render 'edit' }
      end
    end
  end

  private
    def set_kreditur
      @kreditur = Kreditur.find(params[:id])
    end

    def set_krediturs
      @krediturs = Kreditur.paginate(:page => params[:page], :per_page => 10)
    end

    def kreditur_params
      params.require(:kreditur).permit(:kreditur_name, :kreditur_address, :kreditur_phone, :kreditur_email, :kreditur_fax, :kreditur_cp)
    end
end
