source 'https://rubygems.org'

git_source(:github) {|takeaway-challenge| "https://github.com/ElliottZaki/takeaway-challenge.git" }

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
end
