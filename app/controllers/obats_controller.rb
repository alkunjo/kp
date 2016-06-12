class ObatsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_obat, only: [:show, :edit, :update, :destroy, :del]
  before_action :set_obats, only: [:index, :new, :create, :update, :edit, :destroy, :del]
  before_action :set_gobats, only: [:new, :create, :edit, :update, :index]
  before_action :set_generiks, only: [:new, :create, :edit, :update, :index]
  before_action :set_dosages, only: [:new, :create, :edit, :update, :index]
  before_action :set_raciks, only: [:new, :create, :edit, :update, :index]
  before_action :set_kobats, only: [:new, :create, :edit, :update, :index]
  before_action :set_kemasans, only: [:new, :create, :edit, :update, :index]
  before_action :set_pabriks, only: [:new, :create, :edit, :update, :index]

  def index
    @obat = Obat.new
  end

  def show
    respond_to do |format|
      format.js {render 'show'}
    end
  end

  def new
    @obat = Obat.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def edit
  end

  def del    
    respond_to do |format|
      format.js {render 'del'}
    end
  end

  def create
    @obat = Obat.new(obat_params)

    respond_to do |format|
      if @obat.save
        return new
      end
    end
  end

  def update
    respond_to do |format|
      if @obat.update(obat_params)
        return new
      else
        format.js {render 'edit'}
      end
    end
  end

  def destroy
    @obat.destroy
    respond_to do |format|
      return new
    end
  end

  private
    def set_obat
      @obat = Obat.find(params[:id])
    end

    def set_obats
      @obats = Obat.all      
    end

    def set_gobats
      @gobats = GrupObat.all
    end

    def set_generiks
      @generiks = Generik.order(generik_name: :asc)
    end

    def set_dosages
      @dosages = Dosage.all
    end

    def set_raciks
      @raciks = Racik.all
    end

    def set_kobats
      @kobats = KategoriObat.order(kobat_name: :asc)
    end

    def set_kemasans
      @kemasans = Kemasan.all
    end

    def set_pabriks
      @pabriks = Pabrik.all
    end

    def obat_params
      params.require(:obat).permit(:obat_name, :obat_minStock, :obat_hpp, :obat_hna, :obat_kons, :obat_askes, :obat_hnask, :obat_hnahppn, :obat_hnaskppn, :obat_hja, :grup_obat_id, :generik_id, :dosage_id, :racik_id, :kategori_obat_id, :kemasan_id, :pabrik_id)
    end
end
