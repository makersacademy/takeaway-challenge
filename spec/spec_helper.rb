require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require_relative '../lib/fake_sms'

RSpec.configure do |config|
  config.before(:each) do
   stub_const("Twilio::REST::Client", FakeSms)
 end
end
