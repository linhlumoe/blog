FactoryBot.define do
  factory :timeline do
    date { Faker::Date.between(1.year.ago, Date.today) }
    name_of_date { Faker::Book.title }
    description { Faker::Lorem.sentence }
    # picture { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'carousel-2.jpg'), 'image/jpeg') }
    picture { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/carousel-2.jpg')), 'image/jpg') }
  end

  factory :invalid_timeline, parent: :timeline do |f|
    f.name_of_date nil
  end
end
