class KrediturPabriksController < ApplicationController
  before_action :set_pabrik, only: [:index, :new, :edit, :create, :update, :destroy]

  def index
    @kreditur_pabriks = @pabrik.kreditur_pabriks.present?
  end

  def new
    @kreditur_pabrik = @pabrik.kreditur_pabriks.build
    @krediturs = Kreditur.all
    respond_to do |format|
      format.js { render :action => "new"}
    end
  end
  
  def create
    @kreditur_pabrik = @pabrik.kreditur_pabriks.create(kreditur_pabrik_params)

    respond_to do |format|
      if @kreditur_pabrik.save
        format.js { render :action => "save"}
      else
        format.js { render :action => "new" }
      end
    end
  end

  def destroy
    @kreditur_pabrik = @pabrik.kreditur_pabriks.find(params[:id])
    @kreditur_pabrik.destroy
    respond_to do |format|
      format.js { render :action => "save"}
    end
  end

  private
    def set_kreditur_pabrik
      @kreditur_pabrik = KrediturPabrik.find(params[:id])
    end

    def set_pabrik
      @pabrik = Pabrik.find(params[:pabrik_id])
    end

    def kreditur_pabrik_params
      params.require(:kreditur_pabrik).permit(:kreditur_id, :pabrik_id)
    end
end
