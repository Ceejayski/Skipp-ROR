module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
    attr_reader :current_admin_user
  end

  private

  def authenticate_request
    @current_admin_user = AuthorizeApiRequestService.new(request.headers, true).call[:user]
  rescue => e
    render json: { error: 'Not Authorized provide user token' }, status: 401 unless @current_admin_user
  end
end
