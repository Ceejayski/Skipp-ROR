class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    @user = User.new(user_params)
    @user.save!
    render json: { token: encode(user_id: @user.id), user: UserSerializer.new(@user) }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi_errors: @user.errors, status: :unprocessable_entity
  rescue => e
    render json: { error: e.message }, status: 400
  end

  def index
    render jsonapi: @current_user
  rescue => e
    render json: { error: e.message }, status: 400
  end

  def update
    @current_user.update!(user_params)
    render json: @current_user
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi_errors: @current_user.errors, status: :unprocessable_entity
  rescue => e
    render json: { error: e.message }, status: 400
  end

  def shopping_basket
    render jsonapi: @current_user.glasses
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :currency_id)
  end
end
