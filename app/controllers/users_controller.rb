class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # Basic search logic
    @users = User.where.not(id: current_user.id)
    @users = @users.where(state: params[:state]) if params[:state].present?
    @users = @users.where(city: params[:city]) if params[:city].present?
    @users = @users.where(concentration: params[:concentration]) if params[:concentration].present?
  end
end
