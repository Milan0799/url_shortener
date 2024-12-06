module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_request, only: :login
      # POST /login
      def login
        user = User.find_by(email: params[:email])

        # Check if the user exists and password is correct
        if user && user.authenticate(params[:password])
          # If valid, generate JWT and send it in the response
          token = user.generate_jwt
          render json: { token: token }, status: :ok
        else
          # If invalid credentials, return error
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
    end
  end
end
