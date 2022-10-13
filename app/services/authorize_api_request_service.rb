class AuthorizeApiRequestService
  include JwtToken

  def initialize(headers = {}, admin_user=false)
    @headers = headers
    @admin_user = admin_user
  end

  # Service entry point - return valid user object
  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    # check if user is in the database
    # memoize user object
    if @admin_user
      @user ||= AdminUser.find(decoded_auth_token[:user_id]) if decoded_auth_token
    else
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    end
    # handle user not found
  rescue ActiveRecord::RecordNotFound => e
    # raise custom error
    raise e.message

  end

  # decode authentication token
  def decoded_auth_token

    @decoded_auth_token ||= decode(http_auth_header)
  end

  # check for token in `Authorization` header
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      raise "Token not found"
    end
    headers['Authorization'].split(' ').last
  end
end
