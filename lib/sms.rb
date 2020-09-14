require 'twilio-ruby'

class SMS

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new account_sid, auth_token


@client.messages.create(
    from: ENV['from'],
    to: ENV['to'],
    body: "Thank you! Your order was placed and will be delivered before: #{(Time.now + 2500).strftime("%k:%M")}"
  )

end
end