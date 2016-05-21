class PositionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_position, only: [:del, :destroy]
  before_action :set_positions, only: [:create, :destroy, :index, :new]
  
  def index
    @position = Position.new
  end

  def new
    @position = Position.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @position = Position.new(position_params)
    respond_to do |format|
      if @position.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @position.destroy
        return new
      end
    end
  end

  private
    def set_position
      @position = Position.find(params[:id])
    end

    def set_positions
      @positions = Position.all
    end

    def position_params
      params.require(:position).permit(:position_name)
    end
end
