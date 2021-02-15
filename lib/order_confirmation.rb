# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'



    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447401278531' # Your Twilio number
    to = '+447762579223' # Your mobile phone number

    @client.messages.create(
    from: from,
    to: to,
    body: "Order confirmed! Your order will be with you in XXX"
    )
