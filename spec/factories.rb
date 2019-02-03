FactoryBot.define do
  factory :content do
    title          { Faker::Book.title }
    author         { Faker::Book.author }
    summary        { Faker::Lorem.paragraph_by_chars(rand(30..50)) }
    content        { Faker::Lorem.paragraph_by_chars(rand(150..250)) }

    trait :published do
      published_date { Date.yesterday }
    end

    trait :draft do
      published_date { rand(5..60).minutes.from_now }
    end
  end
end
