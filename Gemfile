source 'https://rubygems.org'

# using Ruby 3.0.0 as twilio is only supported to Ruby 3.0
ruby '3.0.0'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.25'
  gem 'twilio-ruby', '5.63.1'
  gem 'dotenv'
  gem 'sinatra'
end
