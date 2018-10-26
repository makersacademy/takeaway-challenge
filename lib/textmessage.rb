require 'twilio-ruby'
class Textmessage
  attr_reader :client, :messages

 def initialize
   account_sid = 'ACfcdc703fc2bcf5603953b5386795accd'
   auth_token = '27ab350f0427b421417abfdc43dac954'
   @client = Twilio::REST::Client.new(account_sid, auth_token)
 end


def deliver
  @client.messages.create(
from: +441315103797,
to: +447887687804,
body: "Thank you! Your order was placed and will be delivered before #{delivery_time} "
)
end


def delivery_time
  "#{Time.now.hour + 1 }:#{Time.now.min}"
end
end
