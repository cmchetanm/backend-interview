require 'rails_helper'
RSpec.describe Point, type: :model do
  describe 'Associations' do
    it { should belong_to(:account) }
  end
end
