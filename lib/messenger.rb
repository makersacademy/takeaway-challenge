require 'twilio-ruby'

class Messenger
  ACCOUNT_SID = 'AC5cc1a7b0f2533f5d4cbc8a5f4fc8b8ba'
  FROM = '+441482900414'
  attr_reader :client

  def initialize auth_token
    @client = Twilio::REST::Client.new(ACCOUNT_SID, auth_token)
  end

  def send_message number
    client.account.messages.create(
      from: FROM,
      to: number,
      body: "Thank you!
      Your order was placed and will be delivered before
      %02d:%02d" % [Time.now.hour + 1, Time.now.min]
    )
    "Message sent to #{number}"
  end
end
