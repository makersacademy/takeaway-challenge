require 'rubygems'
require 'twilio-ruby'

class TwilioSms

  def send_order_sms number
    t = Time.new + 3600
    t = t.strftime("%l:%M")
    account_sid = 'AC***************************'
    auth_token = '3d*****************************'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
      from: '+44*************',
      to: number,
      body: "Thank you! Your order was placed and will be delivered before #{t}"
    )
  end

end
