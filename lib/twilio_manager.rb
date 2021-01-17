  # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
# Using dotenv gem for environment variables in .env file
require "dotenv/load"

class TwilioManager

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from_phone_number = ENV["TWILIO_PHONE_NUMBER"]
    @to_phone_number = ENV["MY_PHONE_NUMBER"]
  end

  def send_sms
    @client.messages.create(
    from: @from_phone_number,
    to: @to_phone_number,
    body: "Your order is on its way!"
      )
    puts "You will receive a confirmation SMS soon."
  end

end
