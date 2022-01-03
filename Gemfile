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

source 'https://www.twilio.com/docs/libraries/ruby'

twilio '5.62.0'

group :send_text do
  gem 'nokogiri'
  gem 'jwt'
  gem 'ruby2_keywords'
  gem 'multipart-post'
  gem 'faraday-rack'
  gem 'faraday-patron'
  gem 'faraday-net_http_persistant'
  gem 'farraday-net_http'
  gem 'faraday-httpclient'
  gem 'faraday-excon'
  gem 'faraday-em_synchrony'
  gem 'faraday-em_http'
  gem 'faraday'
  gem 'twilio-ruby'
end
