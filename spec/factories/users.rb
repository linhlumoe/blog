FactoryBot.define do
  factory :user do
    confirmed_at { Time.now }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    created_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    avatar { Faker::Avatar.image }
  end
end
