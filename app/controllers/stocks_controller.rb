class StocksController < ApplicationController
  autocomplete :outlet, :outlet_name, full: true
  autocomplete :obat, :obat_name, full: true
  before_filter :authenticate_user!
  before_action :set_stock, only: [:show, :edit, :update, :destroy, :del]
  before_action :set_stocks, only: [:index, :new, :create, :update, :edit, :destroy, :del]
  before_action :set_obats, only: [:new, :create, :edit, :update, :index, :destroy]
  before_action :set_outlets, only: [:new, :create, :edit, :update, :index, :destroy]

  def index
    @stock = Stock.new
  end

  def new
    @stock = Stock.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
  end

  def del    
  end

  def create
    stock = Stock.new(stock_params)
    outlet = Outlet.find_by(outlet_name: stock.outlet_name)
    obat = Obat.find_by(obat_name: stock.obat_name)

    current_stok = Stock.find_by(outlet_id: outlet.outlet_id, obat_id: obat.obat_id)

    if current_stok
      qty = current_stok.stok_qty + stock.stok_qty
      if current_stok.update_attribute(:stok_qty, qty)
        return new
      end
    else
      @stock = Stock.new(stok_qty: stock.stok_qty, outlet_id: outlet.outlet_id, obat_id: obat.obat_id)
      if @stock.save
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @stock.update(stock_params)
        return new
      else
        format.js {render 'edit'}
      end
    end
  end

  def destroy
    @stock.destroy
    respond_to do |format|
      return new
    end
  end

  private
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:outlet_id, :obat_id, :stok_qty, :stock_id, :outlet_name, :obat_name)
    end

    def set_stocks
      @stocks = Stock.all
    end

    def set_obats
      @obats = Obat.all      
    end

    def set_outlets
      @outlets = Outlet.all
    end
end