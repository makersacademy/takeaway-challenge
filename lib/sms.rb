require 'twilio-ruby'

class Sms

  def initialize
    @account_sid = ENV["SMS_ACCOUNT_SID"]
    @auth_token = ENV["SMS_AUTH_TOKEN"]
  end
  
  def send_sms(message)
    client = Twilio::REST::Client.new(@account_sid, @auth_token)

    from = ENV["SMS_FROM_NUM"] # Your Twilio number
    to = ENV["SMS_TO_NUM"] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
