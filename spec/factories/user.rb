FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    address { 'Indore' }
    dob { '12/12/2012' }
    gender { 'male' }
    full_phone_number { '9178' + "#{rand(10...99_999_999)}" }
    user_type { 'standard' }
  end
end
