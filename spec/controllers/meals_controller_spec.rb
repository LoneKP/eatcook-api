# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  it 'sends a json object without an image' do
    headers = { 'ACCEPT' => 'application/json' }
    post '/widgets', params: { widget: { name: 'My Widget' } }, headers: headers
    allow(show).to receive(:call).and_return(:data)
  end
  let(:response) {}

  describe 'GET show' do
    it 'returns a 200' do
      request.headers['Authorization'] = 'foo'
      expect(response).to have_http_status(:ok)
    end
  end
end
