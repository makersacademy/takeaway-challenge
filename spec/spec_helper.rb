require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'

# Tried building a fake SMS client
# RSpec.configure do |config|
#   config.before(:each) do
#     stub_const("Twilio::REST::Client", FakeSMS)
#   end
# end
