require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'vcr'
require 'webmock'
require 'envyable'
Envyable.load('./config/env.yml')

TWILIO_VARS = []
TWILIO_VARS << ENV['ACCOUNT_SID']
TWILIO_VARS << ENV['AUTH_TOKEN']
TWILIO_VARS << '+441256830268'
TWILIO_VARS << ENV['PHONE_NUMBER']

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end
