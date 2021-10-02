source 'https://rubygems.org'

ruby '3.0.2'
gem 'twilio-ruby', '~> 5.58', '>= 5.58.3'
gem 'dotenv-rails', groups: [:development, :test]

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
end
