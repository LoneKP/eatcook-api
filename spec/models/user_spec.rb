# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context 'scope tests' do
    let(:meals_and_orders) { create(:meals_and_orders).meals }
    let(:user) { meals_and_orders.first.user }

    describe '#meals_ordered_by_user_in_the_past' do
      it 'returns meals the user ordered and picked up' do
        expect(user.meals_ordered_by_user_in_the_past.size).to eq(2)
      end
    end

    describe '#meals_to_be_ordered_by_user_in_the_future' do
      it 'returns meals the user has ordered and not picked up' do
        expect(user.meals_to_be_ordered_by_user_in_the_future.size).to eq(2)
      end
    end

    describe '#meals_cooked_by_user_in_the_past' do
      it 'returns meals the user has cooked' do
        expect(user.meals_cooked_by_user_in_the_past.size).to eq(2)
      end
    end

    describe '#meals_to_be_cooked_by_user_in_the_future' do
      it 'returns meals the user will cook' do
        expect(user.meals_to_be_cooked_by_user_in_the_future.size).to eq(2)
      end
    end
  end
end
