class ApplicationController < ActionController::API
  include UserAuthentication
  include JwtToken
  include Pundit::Authorization
end
