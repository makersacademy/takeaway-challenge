require 'dotenv'
require 'twilio-ruby'
require './lib/deliverytimecalc.rb'

Dotenv.load

class SMS

  def initialize(calc_time = DeliveryTimeCalc.new, client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))
    @calc_time = calc_time
    @client = client
  end

  def send_sms
    @client.messages.create(info)
  end

  def info
    {
      from: "+447480486810",
      to: ENV['PHONE_NUMBER'],
      body: "Thank you! Your order has been placed and will be delivered before #{delivery_time}."
    }
  end

  def delivery_time
    @calc_time.add_one_hour
  end

end
