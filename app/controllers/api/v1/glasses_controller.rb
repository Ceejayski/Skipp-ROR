class Api::V1::GlassesController < ApplicationController


  # GET /glasses
  def create
    glass = Glass.new(glass_params)
    glass.transaction do

      raise 'Current lens is out of stock' unless glass.lense.stock >= glass.quantity
      raise 'Current frame is out of stock' unless glass.frame.stock >= glass.quantity
      glass.lense.update!(stock: glass.lense.stock - glass.quantity)

      glass.frame.update!(stock: glass.frame.stock - glass.quantity)
      authorize glass
      glass.total_price = glass.quantity * (glass.frame.price + glass.lense.price)
      glass.currency = current_user.currency
      glass.save!
      glass.user = current_user
      render jsonapi: glass, status: :created, includes: [:frame, :lense]
    end
  rescue ActiveRecord::RecordInvalid => e
    render jsonapi:  glass.errors, status: :unprocessable_entity
  rescue Pundit::NotAuthorizedError
    render json: { error: 'Frame is not active please select another' }, status: :unauthorized
  rescue => e
    render json: { error: e.message }, status: 400
  end

  private

  def glass_params

    params.require(:glass).permit(:frame_id, :lense_id, :quantity)
  end

end
