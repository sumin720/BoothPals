class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.where.not(id: current_user.id).ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
