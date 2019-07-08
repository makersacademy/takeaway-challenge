require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
require 'order'
Dotenv.load("../.env")

module SendMessage

  def order_string
    "Thank you! Your order of #{summary} was placed.
    It will be delivered before #{time_calc}.
    Your order total comes to: £#{total_price}."
  end
  
  def send_sms
    # Your Account Sid and Auth Token from twilio.com/console
    # DANGER! This is insecure. See http://twil.io/secure
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
                             body: "#{order_string}",
                             from: '+441254790236',
                              to: ENV["MOBILE_NUMBER"],
                           )
    return "Order Placed"
  end
end
