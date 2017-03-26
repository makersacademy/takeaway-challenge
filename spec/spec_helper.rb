require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'vcr'
require 'webmock'

TWILIO_VARS = []
TWILIO_VARS << 'AC033ff5fd1ab50ecf84e702ae695c4053'
TWILIO_VARS << '74465a4227537a433741dd0749629b3a'
TWILIO_VARS << '+441256830268'
TWILIO_VARS << '+447515356421'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end
