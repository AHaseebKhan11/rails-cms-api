source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'hiredis'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.2'

# Seed data
gem 'factory_bot_rails'
gem 'faker'

# Background jobs
gem 'sidekiq'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers', '~> 3.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
