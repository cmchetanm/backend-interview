require 'rails_helper'
RSpec.describe AccountsController, type: :controller do
  let(:user) { FactoryBot.create(:user, full_phone_number: '919993' + "#{rand(10**5..10**6-1)}") }
  let(:account) { FactoryBot.create(:account, user_id: user.id) }

  describe 'Show index' do
    it 'has a 200 status code' do
      get :show, params: { id: user.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'Update account' do
    it 'it should update the balance' do
      put :update, params: { balance: 100, id: user.id }
      expect(response.status).to eq(200)
    end
    it 'it should not update balance' do
      put :update, params: { id: user.id, balance: nil }
      expect(response.message).to eq 'Unprocessable Entity'
    end
  end
end
