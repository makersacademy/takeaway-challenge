require "twilio-ruby"

class Text

  attr_reader :client
  def initialize(client: nil)
    account_sid = 'ACe25db80663b65858d430a4ec6c9ba42a'
    auth_token = '6698ed5c1c5884a4c6ea7780f3eec380'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def deliver
    client.messages.create(message)
  end

  def message 
  { from: '+14159341234',
    to: '+44791160007',
    body: "Thank you! Your order was placed and will be delivered before #{Time.now + 1 * 60 * 60}"}
  end

end