class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def user_params
    # Allow multiple concentrations and new fields
    params.require(:user).permit(:location, :program_type, concentrations: [])
  end
end
