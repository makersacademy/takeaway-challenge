require 'twilio-ruby'

class TextMessage
  def initialize
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+447401130560'
    to = ENV["MY_PHONE_NUMBER"]
    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%k:%M")}"
    )
  end

  private

  def account_sid
    ENV["TWILIO_ACCOUNT_SID"]
  end
  
  def auth_token
    ENV["TWILIO_AUTH_TOKEN"]
  end
end
