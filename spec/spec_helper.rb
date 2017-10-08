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

TWILIO_VARS = []
TWILIO_VARS << 'ACef3b265110ac900dc6e3404f0a63351a'
TWILIO_VARS << '12c9b3d0695627aa436f8f594d8c4bc9'
TWILIO_VARS << '+441992351213'
TWILIO_VARS << '+447802584879'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end

RSpec.configure do |c|
  c.before { allow($stdout).to receive(:puts) }
end
