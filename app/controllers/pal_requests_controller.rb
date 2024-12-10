class PalRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pal_requests_as_mentee = current_user.pal_requests_as_mentee
    @pal_requests_as_mentor = current_user.pal_requests_as_mentor
  end

  def create
    @pal_request = PalRequest.new(
      mentor_id: params[:mentor_id],
      mentee_id: current_user.id,
      status: 'pending'
    )
    if @pal_request.save
      redirect_to users_path, notice: "Pal request sent!"
    else
      redirect_to users_path, alert: "Could not send pal request."
    end
  end

  def update
    @pal_request = PalRequest.find(params[:id])
    if @pal_request.mentor_id == current_user.id
      if @pal_request.update(status: params[:status])
        redirect_to pal_requests_path, notice: "Pal request updated!"
      else
        redirect_to pal_requests_path, alert: "Could not update request."
      end
    else
      redirect_to pal_requests_path, alert: "Not authorized."
    end
  end
end
