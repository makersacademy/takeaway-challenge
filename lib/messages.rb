require 'twilio-ruby'
class Messages
  def message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_NUMBER'] # Your mobile phone number

    client.api.account.messages.create(
    from: from,
    to: to,
    body: "Thanks for your order! It will be delivered before #{Time.now.+(3600).strftime('%H:%M').}"
    )
  end
end