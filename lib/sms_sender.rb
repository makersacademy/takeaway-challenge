require 'twilio-ruby'

module SMSSender
  
  def send_sms(sender, receiver, message)
    client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    client.account.messages.create(to: sender, from: receiver, body: message)
  end

end
