require 'twilio-ruby'

class Texter

def self.setup
  Twilio.configure do |config|
    config.account_sid = ENV['account_sid']
    config.auth_token = ENV['auth_token']
end

def initialize
  Twilio.setup

  @client = Twilio::REST::Client.new
end

def send time
  @client.messages.create(
  from: '+441772368127',
  to: '+447552768118',
  body: "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}")
end

end