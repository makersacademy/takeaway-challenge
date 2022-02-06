require 'twilio-ruby'

class Message

  def send 
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_FROM"] # Your Twilio number
    to = ENV["TWILIO_TO"] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time_in_an_hour}"
    )

    "Sent"
  end

  private 

  def time_in_an_hour
    t = Time.now + (60*60)
    t.strftime("%H:%M") 
  end

end
