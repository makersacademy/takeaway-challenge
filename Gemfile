source 'https://rubygems.org'

ruby '3.0.0'

gem 'dotenv-rails', groups: [:development, :test]

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'twilio-ruby', '~> 5.63.1'
  gem 'sinatra'
  gem 'colorize'
  
end
