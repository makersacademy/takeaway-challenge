require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    t = Time.new + 60 * 60
    stub_request(:post, "https://ACef4bd5f725088f1dd9765b16f0c2e694:cdaa738b940ec6cc7c354c88a9ce16d7@api.twilio.com/2010-04-01/Accounts/ACef4bd5f725088f1dd9765b16f0c2e694/Messages.json").
         with(:body => {"Body"=>"Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!", "From"=>"+46769439197", "To"=>"+46702204684"},
              :headers => {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/4.11.1 (ruby/x86_64-darwin14 2.3.0-p0)'}).
         to_return(:status => 200, :body => "{ \"sid\":\"lol\"}", :headers => {})
  end
end
