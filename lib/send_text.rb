require 'twilio-ruby'

class SendText
  def send_text
    time = Time.new
    account_sid = "ACad78197ffa4e768e01d488004100210e"
    auth_token = "593db7cfcc7f0873c8b446dc84f51983"
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+447897013272' # Your Twilio number
    to = '+447707952570' # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
    )
  end
end
