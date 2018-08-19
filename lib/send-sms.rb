require 'dotenv'
require 'twilio-ruby'
require './lib/deliverytimecalc.rb'

Dotenv.load

class SMS

  def initialize(calc_time = DeliveryTimeCalc.new)
    @calc_time = calc_time
  end

  def send_sms
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = "+447480486810"
    to = ENV['PHONE_NUMBER']

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order has been placed and will be delivered before #{@calc_time.add_one_hour}."
    )
  end

end
