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

  context 'scope tests' do
    let!(:user) { create(:user, id: 1, name: 'Broder Salsa', email: 'broder@salsa.dk', password: '12345678') }

    before(:each) do
      user.meals.create(id: 1, amount: 2, pickup_time: Time.parse('2012-10-10'))
      user.meals.create(id: 2, amount: 4, pickup_time: Time.now + 20.days)
      user.meals.create(id: 3, amount: 4, pickup_time: Time.now + 100.days)
      user.orders.create(meal_id: 1, pickup_time: Time.parse('2012-10-10'))
      user.orders.create(meal_id: 2, pickup_time: Time.now + 20.days)
      user.orders.create(meal_id: 3, pickup_time: Time.now + 100.days)
    end

    describe '#meals_ordered_by_user_in_the_past' do
      it 'should return meals the user ordered and picked up' do
        expect(user.meals_ordered_by_user_in_the_past.size).to eq(1)
      end
    end

    describe '#meals_ordered_by_user_in_the_future' do
      it 'should return meals the user has ordered and not picked up' do
        expect(user.meals_ordered_by_user_in_the_future.size).to eq(2)
      end
    end

    describe '#meals_cooked_by_user_in_the_past' do
      it 'should return meals the user has cooked' do
        expect(user.meals_cooked_by_user_in_the_past.size).to eq(1)
      end
    end

    describe '#meals_to_be_cooked_by_user_in_the_future' do
      it 'should return meals the user will cook' do
        expect(user.meals_cooked_by_user_in_the_past.size).to eq(1)
      end
    end
  end
end
