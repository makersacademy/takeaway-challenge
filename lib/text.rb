require 'twilio-ruby'

class Text

  def message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['MY_TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_PHONE_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Your order is on the way and will be with you by #{Time.now.hour + 1}.#{Time.now.min}"
    )
  end

end
