require 'twilio-ruby'

class SMS

account_sid = 'ACe96492f460eb29a34060436a2b71bf3e'
auth_token = '57a187b4cbcfc079fad6fa8c7bb85388'

@client = Twilio::REST::Client.new account_sid, auth_token


@client.messages.create(
    from: '+447480619799',
    to: '', #add your number here.
    body: "Thank you! Your order was placed and will be delivered before: #{(Time.now + 2500).strftime("%k:%M")}."
  )

end