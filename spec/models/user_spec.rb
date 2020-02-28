# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email: 'broder@salsa.dk').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: 'Broder Salsa').save
      expect(user).to eq(false)
    end
    it 'ensures password presence' do
      user = User.new(email: 'broder@salsa.dk').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'Broder Salsa', email: 'broder@salsa.dk', password: '12345678').save
      expect(user).to eq(true)
    end
  end
end
