class ApplicationController < ActionController::Base
  # Before any action, check for the valid token in the Authorization header
  before_action :authenticate_request

  # This method ensures that the request has a valid JWT token
  def authenticate_request
    begin
      # Extract token from the 'Authorization' header
      token = request.headers['Authorization']&.split(' ')&.last
      # Decode the token
      decoded = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })
      # Find user by ID from the token's payload
      @current_user = User.find(decoded[0]['user_id'])
    rescue JWT::DecodeError => e
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
