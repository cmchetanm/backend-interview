require 'rails_helper'
RSpec.describe Transaction, type: :model do
  describe 'Associations' do
    it { should belong_to(:account) }
  end

  describe 'Callbacks' do
    it { is_expected.to callback(:check_balance).before(:create) }
  end
end
