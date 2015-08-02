require 'rubygems'
require 'twilio-ruby'

class TwilioSms

  def send_order_sms number
    t = Time.new + 3600
    account_sid = 'ACe92d409db5c0169c0a49dc6c818122c4'
    auth_token = '3d2c7f40ac9387da9d42ad9f8d06eb54'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
      from: '+44 1760742052',
      to: number,
      body: "Thank you! Your order was placed and will be delivered before #{t}"
    )
  end

end