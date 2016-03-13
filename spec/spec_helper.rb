require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'byebug'
require 'dotenv'

RSpec.configure do |config|
  config.before(:each) do
    stub_const("Twilio::REST::Client", FakeTwilio)
  end
end
