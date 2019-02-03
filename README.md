## System Requirements
- Ruby 2.6.1
- Rails 5.2.2
- PostgreSQL
- Redis (`https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis`)

## Getting Started
* Go to cms-api project
* Run `bundle install` to install all dependencies
* Update DB credentials in `config/database.yml` file
* Setup database
    *  Run `rake db:create`
    *  Run `rake db:migrate`
    *  Run `rake db:seed`
* Published date for for draft content in seed files is within minutes of the current time(instead of days),
  to make testing for background jobs more convenient.
* Make sure you redis server is running because will be used for caching and sidekiq
* Run `bin/rails dev:cache` to enable caching in development environment
* Run server `rails s -p 3001`
* Start sidekiq `sidekiq`

## Client Side
* Go to directory `cms` with is the client side app
* Dependencies: Node 8.10.0 or later, NPM
* Run `npm install` and `npm start`. The client side app should open on localhost:3000
* Now you can start communicating with the back end api!

## How to Run Test Suite
Run `rspec` command on your terminal to run all test cases.

## Lint
- `rubocop`
