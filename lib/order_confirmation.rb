require('bundler')
Bundler.require()

def success
  'Thank you! Your order was placed and will be delivered before 18:52'
end

def order
  twilio_send(success)
end

private

ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

def twilio_send(message)
  @client.messages.create(
    to: ENV["M_P_N"],
    from: ENV["T_P_N"],
    body: message
  )
end
