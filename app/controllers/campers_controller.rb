class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_id
  def index
    campers = Camper.all
    render json: campers, status: :ok
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, include: [:activities], status: :ok
  end

  def create
    camper = Camper.create(camper_params)
    return render json: camper, status: :created if camper.valid?

    invalid_camper(camper.errors)
  end

  private

  def invalid_camper(errors)
    render json: { errors: errors.messages.to_a }, status: :unprocessable_entity
  end

  def camper_params
    params.permit([:name, :age])
  end

  def invalid_id
    render json: { error: 'Camper not found' }, status: :not_found
  end
end
