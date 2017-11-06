require "twilio-ruby"
require_relative "authentication"
class SMS

  def send_sms
    client = Twilio::REST::Client.new $account_sid, $auth_token
    client.messages.create(
    to: $TO,
    from: $FROM,
    body: message_body
     )
    "SMS delivered"
  end

  def message_body
    "Thank you! Your order was placed and will be delivered before"\
    " #{(Time.now + 3600).strftime("%H:%M")}."
  end

end
