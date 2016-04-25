require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'dotenv'
Dotenv.load

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    t = Time.new + 60 * 60
    stub_request(:post, /api.twilio.com\/.*\/Messages.json/)
    .with(:body => {"Body"=>"Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!", "From"=>ENV['TWILIO_NR'], "To"=>ENV['CUSTOMER_NR']})
    .to_return(:status => 200, :body => "{ \"sid\":\"lol this is stubbed reply\"}")
  end
end
