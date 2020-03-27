# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:pickups) }
    it { should have_many(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:pickup_time) }
    it { should validate_presence_of(:cook_provides_packaging) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:zip) }
  end
end
