class Api::V1::Admin::SessionsController < Api::V1::Admin::BaseController
  skip_before_action :authenticate_request, only: [:create]
  def create
    admin_user = AdminUser.find_by(email: session_params[:email])
    if admin_user && admin_user.authenticate(session_params[:password])
      render json: { token: encode(user_id: admin_user.id), message: 'Login Successful' }
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def session_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
