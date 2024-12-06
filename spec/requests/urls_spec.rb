require 'rails_helper'

RSpec.describe "Urls API", type: :request do
  let(:user) { create(:user) }  # This uses FactoryBot to create a user
  let(:valid_token) { user.generate_jwt }
  let(:valid_attributes) { { long_url: 'https://example.com' } }

  describe 'POST /api/v1/urls' do
    context 'when the request is valid' do
      it 'creates a shortened URL and returns it' do
        post '/api/v1/urls', params: valid_attributes, headers: { 'Authorization' => "Bearer #{valid_token}" }

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('short_url')
        expect(JSON.parse(response.body)['long_url']).to eq('https://example.com')
      end
    end
  end
end
