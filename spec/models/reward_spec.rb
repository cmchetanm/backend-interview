require 'rails_helper'
RSpec.describe Reward, type: :model do
  describe 'Associations' do
    it { should have_and_belong_to_many(:users) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end
