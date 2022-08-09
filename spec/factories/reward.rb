FactoryBot.define do
  factory :reward do
    name { Faker::Name.name.split[0] }
    price { rand(10...9999) }
    reward_type { 'test' }
  end
end
