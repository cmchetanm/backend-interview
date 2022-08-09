FactoryBot.define do
  factory :account do
    balance { rand.to_s[2..9] }
    message { 'Account Testing' }
  end
end
