require 'message_sender'
require 'twilio-ruby'
require 'date'
require 'webmock'
include WebMock::API

WebMock.enable!

describe MessageSender do

  # it "can send text" do
  #   stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/AC81484a848edc0fb0b146b2a41ed43093/Messages.json").
  #   with(body: { "Body" => "Hello John, your order has been dispatched from Makers Bistro.\nexample message It will arrive in 45 minutes at 12.35!", "From" => "+441740582048", "To" => "09876543" },
  #   headers: { 'Accept' => 'application/json', 'Accept-Charset' => 'utf-8', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization' => 'Basic QUM4MTQ4NGE4NDhlZGMwZmIwYjE0NmIyYTQxZWQ0MzA5Mzo1MWJkN2NhMTJhMjEyYTU2NTgyNDJjMjY4MjIzNzU2ZA==', 'Content-Type' => 'application/x-www-form-urlencoded', 'User-Agent' => 'twilio-ruby/4.13.0 (ruby/x86_64-darwin16 2.4.0-p0)'}).
  #   to_return(status: 200, body: "", headers: {})
  # end

end
