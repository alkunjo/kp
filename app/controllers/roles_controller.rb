class RolesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_role, only: [:del, :destroy]
  before_action :set_roles, only: [:create, :destroy, :index, :new]
  
  def index
    @role = Role.new
  end

  def new
    @role = Role.new
    respond_to do |format|
      format.js {render 'new'}
    end
  end

  def del    
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        return new
      end
    end
  end

  def destroy
    respond_to do |format|
      if @role.destroy
        return new
      end
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def set_roles
      @roles = Role.all
    end

    def role_params
      params.require(:role).permit(:role_name, :role_desc)
    end
end
