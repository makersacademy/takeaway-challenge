# require 'bundler/setup'
require 'twilio-ruby'

  # set up a client to talk to the Twilio REST API
  account_sid = 'ACb9fa17654ff40713d73c51a4fac680b2'
  auth_token = 'bdf7e3774b022a2cb92d22d92406125c'
  client = Twilio::REST::Client.new account_sid, auth_token
  

  # setup sender/receiver
  from = '+447578201809'
  to = '+447815926306'
  
  # send an sms
  client.api.account.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime("%k:%M")}."
  )

