require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_one(:account).dependent(:destroy) }
    it { should have_and_belong_to_many(:rewards) }
    it { should belong_to(:client).class_name('User').with_foreign_key(:client_id).optional }
    it { should have_many(:customers).class_name('User').with_foreign_key(:client_id).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_uniqueness_of(:email) }
  end

  describe 'Enum' do
    it { should define_enum_for(:gender).with_values(%i[male female]) }
    it { should define_enum_for(:user_type).with_values(%i[standard gold platinum]) }
  end

  describe 'Callbacks' do
    it { is_expected.to callback(:create_user_account).after(:create) }
    describe '#before_validation' do
      let(:user) { FactoryBot.create(:user, full_phone_number: '919993' + "#{rand(10**5..10**6-1)}") }
      it 'runs .parse_full_phone_number before_validation' do
        expect(user).to receive(:parse_full_phone_number)
        user.run_callbacks(:validation)
      end
    end
  end
end
