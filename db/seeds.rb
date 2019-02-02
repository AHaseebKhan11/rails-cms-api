10.times do
  Content.create(title: Faker::Book.title, author: Faker::Book.author, summary: Faker::Lorem.paragraph_by_chars(rand(30..50)), content: Faker::Lorem.paragraph_by_chars(rand(150..250)), published_date: 2.minutes.from_now)
end
