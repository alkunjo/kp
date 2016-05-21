class RaciksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_racik, only: [:del, :destroy]
  before_action :set_raciks, only: [:create, :destroy, :new, :index]
  
  def index
    @racik = Racik.new
  end

  def new
    @racik = Racik.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @racik = Racik.new(racik_params)
    respond_to do |format|
      if @racik.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @racik.destroy
        return new
      end
    end
  end

  private
    def set_racik
      @racik = Racik.find(params[:id])
    end

    def set_raciks
      @raciks = Racik.all
    end

    def racik_params
      params.require(:racik).permit(:racik_name)
    end
end
