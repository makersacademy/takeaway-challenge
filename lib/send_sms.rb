# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require_relative 'phonenumber'

class Sms

  def initialize

  account_sid = 'ACc48495a08b4c31b8233673e4f866ed8a'
  auth_token = '0064a746ab717aa6068f9c5da2c4bcfd'
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+blank' # Your Twilio number
  to = '+blank' # Your mobile phone number
  time = Time.new
  hour = time.hour
  mins = time.min
  if mins < 10
    min = "0#{mins}"
  else
    min = mins
  end
  time1 = hour + 1
  time2 = "#{time1}:#{min}"

  client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before #{time2}"
  )

  end

end
