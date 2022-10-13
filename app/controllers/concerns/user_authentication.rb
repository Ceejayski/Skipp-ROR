module UserAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
    attr_reader :current_user
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequestService.new(request.headers).call[:user]
    Current.currency = @current_user&.currency
  rescue => e
    render json: { error: 'Not Authorized provide user token' }, status: 401 unless @current_user
  end
end
