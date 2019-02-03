# Drafts
500.times do
  Content.create(title: Faker::Book.title, author: Faker::Book.author, summary: Faker::Lorem.paragraph_by_chars(rand(30..50)), content: Faker::Lorem.paragraph_by_chars(rand(150..250)), published_date: rand(5..60).minutes.from_now)
end

# Published Content
500.times do
  Content.create(title: Faker::Book.title, author: Faker::Book.author, summary: Faker::Lorem.paragraph_by_chars(rand(30..50)), content: Faker::Lorem.paragraph_by_chars(rand(150..250)), published_date: rand(5..60).days.ago)
end
