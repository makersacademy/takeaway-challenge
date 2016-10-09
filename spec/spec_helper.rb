require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'fakesms'

RSpec.configure do |config|
  config.before(:each) do
    stub_const("Twilio::REST::Client", FakeSMS)
  end
end