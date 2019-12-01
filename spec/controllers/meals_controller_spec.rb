require 'rails_helper'

RSpec.describe MealsController, type: :controller do

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains JSON response with meal attributes' do
      json_response = JSON.parse(response.body)
      expect(hash_body.keys).to match_array(
        [
          :id,
          :user_id,
          :name,
          :pickup_time,
          :cook_provides_packaging,
          :amount,
          :created_at,
          :updated_at,
          :description,
          :address,
          :zip,
          :city,
          :tags
        ]
      )
    end
  end

end
