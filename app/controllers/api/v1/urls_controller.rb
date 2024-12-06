module Api
  module V1
    class UrlsController < ApplicationController
      before_action :authenticate_request

      # POST /api/v1/urls
      def create
        long_url = params[:long_url]

        # Generate the shortened URL
        @url = Url.find_or_create_by(long_url: long_url) do |url|
          url.short_url = generate_short_url
        end

        # Return the shortened URL in the response
        render json: { short_url: @url.short_url, long_url: @url.long_url }, status: :created
      end

      private

      def generate_short_url
        SecureRandom.hex(5)  # Generates a 10-character random string for the short URL
      end
    end
  end
end
