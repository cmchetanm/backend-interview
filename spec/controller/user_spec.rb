require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) do
    FactoryBot.create(:user, email: 'garima.joshi@gmail.com', full_phone_number: '9172' + "#{rand(10...99_999_999)}")
  end
  describe 'POST/create' do
    it 'it should create' do
      expect do
        post :create,
             params: { use_routes: '/users',
                       user: { first_name: user.first_name, last_name: user.last_name, email: Faker::Internet.email, address: user.address,
                               full_phone_number: '919993' + "#{rand(10...999_999)}" } }
      end.to change { Account.count }
    end
    it 'it should not create' do
      post :create,
           params: { use_routes: '/users',
                     user: { first_name: user.first_name, last_name: user.last_name, email: Faker::Internet.email, address: user.address,
                             full_phone_number: user.full_phone_number } }
      expect(response.message).to eq('Unprocessable Entity')
    end
  end

  describe 'GET/index' do
    it 'get list of records' do
      get :index, params: { use_routes: '/users' }
      expect(response.message).to eq('OK')
    end
  end

  describe 'GET/show' do
    it 'it should show record' do
      get :show, params: { use_routes: '/users', id: user }
      expect(response.message).to eq('OK')
    end
  end

  describe 'PATCH/update' do
    it 'it should update the record' do
      patch :update, params: { use_routes: '/users', id: user, user: { first_name: 'Test user' } }
      expect(response.message).to eq('OK')
    end
  end

  describe 'DELETE/destroy' do
    it 'it should delete the record' do
      delete :destroy, params: { use_routes: '/users', id: user }
      message = JSON.parse response.body
      expect(message['message']).to eq('user Deleted')
    end
  end
end
