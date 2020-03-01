source "https://rubygems.org"

ruby '2.6.5'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test, :development do
  gem "twilio-ruby"
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console'
  gem 'dotenv'
  gem 'rubocop', '~> 0.80.1', require: false
end
