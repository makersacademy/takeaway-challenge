require 'twilio-ruby'
require_relative 'takeaway'

module Twilio

attr_reader :client

ACCOUNT_SID = 'ACc772cdd79988a960ca9fab13e3122a1e'
AUTH_TOKEN = '9094b2c1421543822bd7cf8bcabbe929'

  def send_message(sender,receiver,client = Twilio::REST::Client)
    api_link = client.new ACCOUNT_SID, AUTH_TOKEN
    api_link.messages.create(
    from: sender,
    to: receiver,
    body: "Thank you! Your order was placed and will be delivered before #{Time.new + (60*60)}."
    )
  end
end
