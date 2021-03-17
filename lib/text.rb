# require 'rubygems'
require 'twilio-ruby'
# require 'dotenv'
# Dotenv.load

class Text

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV['TWILIO_NUMBER']
  end

  def send_sms(total, number)
    @client.messages.create(
      from: @from,
      to: number,
      body: "Thank you! Your order was placed and will
      be delivered #{Time.now + 60 * 60}."
    )
  end

end
