  # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
# Using dotenv gem for environment variables in .env file
require "dotenv/load"

class TwilioManager

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @from_phone_number = ENV["TWILIO_PHONE_NUMBER"]
    @to_phone_number = ENV["MY_PHONE_NUMBER"]
  end

  def send_sms(order_estimated_time)
    @client.messages.create(
    from: @from_phone_number,
    to: @to_phone_number,
    body: "Your order is on its way! It will be with you by: #{time_string(order_estimated_time)}."
      )
    puts "You will receive a confirmation SMS soon."
  end

  def time_string(time)
    time.strftime("%-l:%M %p")
  end

end
