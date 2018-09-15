require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'vcr'
require 'webmock/rspec'
require 'dotenv'
Dotenv.load

TWILIO_VARS = []
TWILIO_VARS << 'TWILIO_ACCOUNT_SID'
TWILIO_VARS << 'TWILIO_ACCOUNT_AT'
TWILIO_VARS << 'TWILIO_PHONE'
TWILIO_VARS << 'PHONE_NUMBER'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop punk? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
