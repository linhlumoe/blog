FactoryBot.define do
  factory :comment do
    commenter { Faker::Internet.email }
    text { Faker::Lorem.paragraph }
    name { Faker::Name.name }
    phone "0123456789"
    association :article, factory: :article
  end

  factory :invalid_comment, parent: :comment do |f|
    f.commenter nil
  end
end
