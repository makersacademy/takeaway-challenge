# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# account_sid = ' '
# auth_token = ''
# client = Twilio::REST::Client.new(account_sid, auth_token)
#
# from =  # Your Twilio number
# to =  # Your mobile phone number
#
# client.messages.create(
# from: from,
# to: to,
# body: "Test from mini beasty. Success!"
# )

class SMSClient
  def initialize
    @client = Twilio::REST::Client.new(
      ENV.fetch("TWILIO_ACCOUNT_SID"),
      ENV.fetch("TWILIO_AUTH_TOKEN"),
    )
  end

  def send_message(from:, to:, body:)
    @client.messages.create(from: from, to: to, body: body)
  end
end

class FakeSMS
  Message = Struct.new(:from, :to, :body)

  cattr_accessor :messages
  self.messages = []

  def initialize(_account_sid, _auth_token)
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages << Message.new(from: from, to: to, body: body)
  end
end
