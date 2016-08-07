class PabriksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_pabrik, only: [:show, :del, :destroy]
  before_action :set_pabriks, only: [:create, :destroy, :new, :index]
  
  def index
    @pabrik = Pabrik.new
  end

  def show
    respond_to do |format|
      format.js {render "show"}
      format.pdf do 
        pdf = PabrikPdf.new(@pabrik)
        send_data pdf.render, filename: "pabrik_#{@pabrik.pabrik_id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def new
    @pabrik = Pabrik.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
  end

  def del    
  end

  def create
    @pabrik = Pabrik.new(pabrik_params)

    respond_to do |format|
      if @pabrik.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @pabrik.destroy
        return new
      end
    end
  end

  private
    def set_pabrik
      @pabrik = Pabrik.find(params[:id])
    end

    def set_pabriks
      @pabriks = Pabrik.all
    end

    def pabrik_params
      params.require(:pabrik).permit(:pabrik_name)
    end
end
