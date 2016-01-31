require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'vcr'
require 'webmock'

sid = 'TWILIO_ACCOUNT_SID'
token = 'TWILIO_AUTH_TOKEN'
from_phone = 'TWILIO_PHONE'
to_phone = 'TWILIO_DESTINATION_PHONE'

TWILIO_VARS = [sid, token, from_phone, to_phone].freeze

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end
