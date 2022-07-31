class SMS

  # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
  require 'twilio-ruby'

  def send_sms
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+13187272009' # Your Twilio number
    to = ENV["TO_NUM"] # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before order time + 1 hr"
    )
  end
end
