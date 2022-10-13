class Api::V1::Admin::FramesController < Api::V1::Admin::BaseController
  before_action :set_frame, only: [:show, :update, :destroy]

  # GET /frames
  def index
    @frames = Frame.all
    render jsonapi: @frames
  end

  # POST /frames
  def create
    @frame = Frame.new(frame_params)
    @frame.save!
    render jsonapi: @frame, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi_errors: @frame.errors, status: :unprocessable_entity

  rescue => e
    render json: { error: e.message }, status: 400
  end

  # GET /frames/:id
  def show
    render jsonapi: @frame
  end

  # PUT /frames/:id
  def update
    @frame.update!(frame_params)
    render jsonapi: @frame
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi_errors: @frame.errors, status: :unprocessable_entity
  rescue => e
    render json: { error: e.message }, status: 400
  end

  # DELETE /frames/:id
  def destroy
    @frame.destroy!
    render json: { message: 'Frame deleted' }
  end

  private

  def frame_params
    params.require(:frame).permit(:name, :description, :price, :stock, :status, :currency_id)
  end

  def set_frame
    @frame = Frame.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

end
