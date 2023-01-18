class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_id
  def index
    activities = Activity.all
    render json: activities, status: :ok
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    head :no_content
  end

  private

  def invalid_id
    render json: { error: 'Activity not found' }, status: :not_found
  end
end
