class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :del]
  before_action :set_users, only: [:index, :new, :create, :update, :edit, :destroy, :del]
  before_action :set_roles, only: [:new, :create, :edit, :update, :index]
  before_action :set_positions, only: [:new, :create, :edit, :update, :index]
  before_action :set_outlets, only: [:new, :create, :edit, :update, :index]
  # GET /users
  # GET /users.json
  def index
    @user = User.new
  end

  def show
    respond_to do |format|
      format.js {render 'show'}
    end
  end

  def new
    @user = User.new
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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        return new
      end
    end
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
    respond_to do |format|
      if successfully_updated
        return new
      else
        format.js {render 'edit'}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      return new
    end
  end

  def import
    User.import(params[:file])
    redirect_to users_path, notice: "Users imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_username, :user_name, :user_address, :user_phone, :role_id, :position_id, :outlet_id, :email, :password, :password_confirmation)
    end

    def set_users
      @users = User.all
    end

    def set_outlets
      @outlets = Outlet.all
    end

    def set_roles
      @roles = Role.all
    end

    def set_positions
      @positions = Position.all
    end

    def needs_password?(user, params)
      params[:password].present?
    end
end
