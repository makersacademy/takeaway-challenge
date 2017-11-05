require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'vcr'
require 'webmock'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end


TWILIO_VARS = []
TWILIO_VARS << "AC3c7f3add2a39566e305dbf7d80fd56db"
TWILIO_VARS << "986acafbb584afc7ae3e48993a88fe4f"
TWILIO_VARS << "+447864968591"
TWILIO_VARS << "+447864968591"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end
