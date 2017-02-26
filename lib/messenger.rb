require 'twilio-ruby'
require 'dotenv'

class MessengerService

  def initialize(client = Twilio::REST::Client)
    Dotenv.load
    @sid = ENV['TWILIO_AC_SID']
    @token = ENV['TWILIO_AC_TOKEN']
    @from = ENV['TWILIO_PHONE_NO']
    @to = ENV['CUST_PHONE_NO']
    @client = client
  end

  def send_SMS(message = "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%H:%M")}")

    # set up a client to talk to the Twilio REST API
    @client = @client.new sid, token

    @client.account.messages.create(
      from: from,
      to: to,
      body: message
      )
  end

  private
  attr_reader :sid, :token, :from, :to
end
