require 'rails_helper'

RSpec.describe RewardsController, type: :controller do
  let(:user) { FactoryBot.create(:user, full_phone_number: '919993' + "#{rand(10**5..10**6-1)}") }
  describe 'GET /index' do
    it 'get list of records(awards)' do
      get :index, params: { use_routes: '/rewards' }
      expect(response.message).to eq('OK')
    end
  end

  describe 'POST /create' do
    it 'it should create reward' do
      FactoryBot.create(:user, email: 'garima.joshi@gmail.com', full_phone_number: '919993' + "#{rand(10**5..10**6-1)}")
      post :create, params: { use_routes: '/rewards', reward: { name: Faker::Name.name, price: 500 } }
      expect(response.message).to eq('OK')
    end
  end

  describe 'GET /point' do
    it 'it should return point' do
      get :point, params: { use_routes: '/point', user_id: user }
      expect(response.message).to eq('OK')
    end

    it 'it should not return any point' do
      get :point, params: { use_routes: '/point', user_id: 0 }
      message = eval(response.body)[:message]
      expect(message).to eq('user with id 0 not found')
    end
  end

  describe 'POST /purchase_reward' do
    let(:reward) { FactoryBot.create(:reward) }
    it 'it should create transaction' do
      post :purchase_reward, params: { use_routes: '/purchase_reward', data: { user_id: user, reward_id: reward } }
      expect(response.message).to eq('OK')
    end
  end
end
