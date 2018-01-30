FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    association :user, factory: :user
    summary { Faker::Lorem.sentence }
    status 1
  end

  factory :invalid_article, parent: :article do |f|
    f.title nil
  end
end
