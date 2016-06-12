class TransTypesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_ttype, only: [:del, :destroy]
  before_action :set_ttypes, only: [:new, :create, :destroy, :index]
  
  def index
    @ttype = TransType.new
  end

  def new
    @ttype = TransType.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @ttype = TransType.new(ttype_params)
    respond_to do |format|
      if @ttype.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @ttype.destroy
        return new
      end
    end
  end

  def import
    TransType.import(params[:file])
    redirect_to trans_types_path, notice: "Kategori Obat imported."
  end

  private
    def set_ttype
      @ttype = TransType.find(params[:id])
    end

    def set_ttypes
      @ttypes = TransType.paginate(:page => params[:page], :per_page => 10)
    end

    def ttype_params
      params.require(:trans_type).permit(:ttype_name)
    end
end
