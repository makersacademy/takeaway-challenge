source 'https://rubygems.org'

ruby '3.0.2'

gem 'dotenv-rails', groups: [:development, :test]
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'gem-that-requires-env-variables'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
end

