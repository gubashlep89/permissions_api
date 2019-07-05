class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :check_permission, :grant_permissions]
  before_action :set_roles, only: [:grant_permissions]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # GET send permission id in this method to check if it include in user
  def check_permission
    if @user.permissions.pluck(:id).include?(params[:permission_id].to_i)
      render json: 'Permission found'
    else
      render json: 'Permission not found'
    end
  end

  # POST send role ids to this method to update roles in user
  def grant_roles
    @user.roles = @roles
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Find roles by role ids
  def set_roles
    @roles = Role.where(id: params[:role_ids])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:id, :name, permissions_attributes: [:id, :name, :permission_type, :role_id, :user_id, :_destroy])
  end
end
