# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:new_user) { build(:user) }
  describe '#login' do
    it 'logs the user in when email and password is correct' do
      login_params = { 'email' => user.email, 'password' => user.password }
      post :login, params: login_params
      expect(response).to have_http_status(:ok)
    end

    it 'gives status 401 when user does not get logged on' do
      login_params = {
        'email' => 'wrong@email.com',
        'password' => 'wrongpassword99'
      }
      post :login, params: login_params
      expect(response).to have_http_status(401)
    end
  end

  describe '#register' do
    it 'creates a new user' do
      expect(new_user.save).to be true
    end
  end
end
