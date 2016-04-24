require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    t = Time.new + 60 * 60
    stub_request(:post, /api.twilio.com\/.*\/Messages.json/)
    .with(:body => {"Body"=>"Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!", "From"=>"+46769439197", "To"=>"+46702204684"})
    .to_return(:status => 200, :body => "{ \"sid\":\"lol this is stubbed reply\"}")
  end
end
