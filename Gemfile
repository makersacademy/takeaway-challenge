source 'https://rubygems.org'

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
end

group :test do
  gem "webmock"
end
    
gem "twilio-ruby", "~> 5.61"

gem "dotenv", "~> 2.7"

gem "vcr", "~> 6.0"
