class Api::V1::Admin::LensesController < Api::V1::Admin::BaseController
  before_action :set_lens, only: [:show, :update, :destroy]

  # GET /lenses
  def index
    @lenses = Lense.all
    render jsonapi: @lenses
  end

  # POST /lenses
  def create
    @lens = Lense.new(lens_params)
    @lens.save!
    render jsonapi: @lens, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi_errors: @lens.errors, status: :unprocessable_entity
  rescue => e
    render json: { error: e.message }, status: 400
  end

  # GET /lenses/:id
  def show
    render jsonapi: @lens
  end

  def update
    @lens.update!(lens_params)
    render json: @lens
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi_errors: @lens.errors, status: :unprocessable_entity

  rescue => e
    render json: { error: e.message }, status: 400
  end

  def destroy
    @lens.destroy!
    render json: { message: 'Lens deleted' }
  end

  private

  def lens_params
    params.require(:lens).permit(:color, :description, :price, :lens_type, :stock, :prescription_type, :lens_type, :currency_id)
  end

  def set_lens
    @lens = Lense.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

end
