class UrlsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_url, only: [:show]

  def new
    # Render the form
  end

  def create
    long_url = params[:long_url]

    # Check if URL already exists
    @url = Url.find_or_create_by(long_url: long_url) do |url|
      url.short_url = generate_short_url
    end
    @shortened_url = request.base_url + "/" + @url.short_url

    redirect_to new_url_path(shortened_url: @shortened_url)
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])
    if @url
      redirect_to @url.long_url, allow_other_host: true
    else
      render plain: "URL not found", status: 404
    end
  end

  private

  def set_url
    @url = Url.find_by(short_url: params[:id])
  end

  def generate_short_url
    SecureRandom.hex(5)  # Generates a 10-character random string
  end
end
