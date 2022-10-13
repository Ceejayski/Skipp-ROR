class Api::V1::HomeController < ApplicationController
  skip_before_action :authenticate_request, if: :no_auth?
  after_action :verify_policy_scoped



  def index
    lenses = Lense.all
    frames = policy_scope(Frame)
    render json: { message: 'Shop for glasses', frames: FrameSerializer.new(frames), lenses: LenseSerializer.new(lenses) }
  end

  private

  def no_auth?
    request.headers['Authorization'].blank?
  end

end
