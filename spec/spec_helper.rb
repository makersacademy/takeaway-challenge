require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'vcr'
require 'webmock'
TWILIO_VARS = []
TWILIO_VARS << 'TWILIO_ACCOUNT_SID'
TWILIO_VARS << 'TWILIO_AUTH_TOKEN'
TWILIO_VARS << 'TWILIO_PHONE'
TWILIO_VARS << 'TWILIO_DESTINATION_PHONE'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock 
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end
