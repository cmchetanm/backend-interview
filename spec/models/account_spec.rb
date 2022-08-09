require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:transactions) }
    it { should have_many(:points).dependent(:destroy) }
  end
end
