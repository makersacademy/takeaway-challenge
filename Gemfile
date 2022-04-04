source 'https://rubygems.org'

ruby '3.0.2'

gem "celluloid-fsm"
gem "celluloid"
gem "faye-websocket"
gem "sinatra"
gem "twilio-ruby"
gem "rack"
gem "thin"
gem "puma"
gem "reel"
gem "http"
gem "webrick"

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
end
