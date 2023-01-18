class SignupsController < ApplicationController
  def create
    signup = Signup.create(signup_params)
    return render json: signup.activity, status: :created if signup.valid?

    invalid_signup(signup.errors)
  end

  private

  def invalid_signup(errors)
    render json: { errors: errors.messages.to_a }, status: :unprocessable_entity
  end

  def signup_params
    params.permit([:time, :camper_id, :activity_id])
  end
end
