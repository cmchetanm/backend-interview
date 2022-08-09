FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    address { 'Indore' }
    dob { '12/12/2012' }
    gender { 'male' }
    full_phone_number { '919993' + "#{rand(10**5..10**6-1)}" }
    user_type { 'standard' }
  end
end
