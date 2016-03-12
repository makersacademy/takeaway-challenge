require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load
class Sms
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new account_sid, auth_token

  t = Time.new + 3600
  @time = t.strftime('%H:%M')

  @client.messages.create(
    from: ENV['FROM'],
    to: ENV['MY_NUM'],
    body: "Your order will be with you before #{@time}"
  )
end
