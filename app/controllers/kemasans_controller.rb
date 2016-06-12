class KemasansController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_kemasan, only: [:edit, :update, :del, :destroy]
  before_action :set_kemasans, only: [:create, :update, :new, :destroy, :index]
  
  def index
    @kemasan = Kemasan.new
  end

  def new
    @kemasan = Kemasan.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
  end

  def del    
  end

  def create
    @kemasan = Kemasan.new(kemasan_params)
    respond_to do |format|
      if @kemasan.save
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @kemasan.update(kemasan_params)
        return new
      else
        format.js {render 'edit'}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @kemasan.destroy
        return new
      end
    end
  end

  private
    def set_kemasan
      @kemasan = Kemasan.find(params[:id])
    end

    def set_kemasans
      @kemasans = Kemasan.paginate(:page => params[:page], :per_page => 10)
    end

    def kemasan_params
      params.require(:kemasan).permit(:kemasan_name, :kemasan_vol, :kemasan_cap, :kemasan_unit)
    end
end
