require 'twilio-ruby'
require 'dotenv/load'

def send_sms(text)
  account_sid = ENV['ACC_SID']
  auth_token = ENV['TOKEN']
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = ENV['TW_TEST'] # Your Twilio number
  to = ENV['MY_NUMBER'] # Your mobile phone number

  client.messages.create(
  from: from,
  to: to,
  body: text
  )
end
