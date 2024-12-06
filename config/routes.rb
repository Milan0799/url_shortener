Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :urls
  get ':short_url', to: 'urls#show', as: 'short_url'

  # Health check route for monitoring
  get 'up' => 'rails/health#show', as: :rails_health_check

  # API routes for URL shortening (expose the API)
  namespace :api do
    namespace :v1 do
      resources :urls, only: [:create]  # POST /api/v1/urls to create a short URL
      post 'login', to: 'auth#login'   # POST /api/v1/login for user login and JWT token
    end
  end

  # Root path (you can configure this to be any controller/action you prefer)
  root "urls#new"   # Set the root path to the new URL form (or a default home page)
end
