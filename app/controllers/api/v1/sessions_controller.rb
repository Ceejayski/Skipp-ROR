class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      render json: { token: encode(user_id: user.id) }
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def session_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
