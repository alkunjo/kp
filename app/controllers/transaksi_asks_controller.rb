class TransaksiAsksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_transaksi_ask, only: [:show, :edit, :update, :destroy, :del]
  before_action :set_transaksi_asks, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_outlets, only: [:index, :new, :create, :edit, :update, :destroy]
  autocomplete :outlet, :outlet_name, full: true

  def index
    @transaksi_ask = TransaksiAsk.new
  end

  def show
  end

  def new
    @transaksi_ask = TransaksiAsk.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
  end

  def create
    @transaksi_ask = TransaksiAsk.new(transaksi_ask_params)
    receiver = Outlet.find_by(outlet_name: @transaksi_ask.outlet_name)
    @transaksi_ask = TransaksiAsk.create(sender_id: current_user.outlet_id, receiver_id: receiver.outlet_id)

    respond_to do |format|
      if @transaksi_ask
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @transaksi_ask.update(transaksi_ask_params)
        return new
      else
        format.js {render 'edit'}
      end
    end
  end

  def destroy
    @transaksi_ask.destroy
    respond_to do |format|
      return new
    end
  end

  def del
  end

  def get_autocomplete_items(parameters)
    items = active_record_get_autocomplete_items(parameters)
    items = items.where.not(outlet_id: current_user.outlet_id)
  end

  private
    def set_transaksi_ask
      @transaksi_ask = TransaksiAsk.find(params[:id])
    end

    def set_transaksi_asks
      @transaksi_asks = TransaksiAsk.all
    end

    def set_outlets
      @outlets = Outlet.where.not(outlet_id: current_user.outlet_id)
    end

    def transaksi_ask_params
      params.require(:transaksi_ask).permit(:sender_id, :receiver_id, :sender_name, :receiver_name, :outlet_name)
    end
end
