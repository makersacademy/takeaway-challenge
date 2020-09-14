require 'twilio-ruby'

module Restaurant

def send(body)

account_sid = 'ACe96492f460eb29a34060436a2b71bf3e'
auth_token = '57a187b4cbcfc079fad6fa8c7bb85388'

@client = Twilio::REST::Client.new account_sid, auth_token


@client.messages.create(
    from: '+447480619799',
    to: '+447845585137',
    body: body
  )

end
end