source 'https://rubygems.org'

gem 'dotenv-rails', groups: [:development, :test]
gem 'dotenv-rails', require: 'dotenv/rails-now'
ruby '3.0.2'
gem 'twilio-ruby', '~> 5.58', '>= 5.58.3'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
end
