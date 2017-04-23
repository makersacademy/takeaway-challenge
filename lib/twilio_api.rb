require 'dotenv/load'
require 'twilio-ruby'


module TwilioAPI

  def send_sms
    account_sid = ENV['TWILIO_ACC_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(
    account_sid,
    auth_token
    )

    @client.account.messages.create(
      from: ENV['TWILIO_NUMBER_NO'],
      to: ENV['CUSTOMER_PHONE_NO'],
      body: "Thanks! Your order was placed & will be delivered within the hour."
    )
    puts "A text has been sent to confim your order"
  end

end
