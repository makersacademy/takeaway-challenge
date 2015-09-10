require 'rubygems'
require 'twilio-ruby'

class TwilioTest

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def time
    time = Time.now.strftime('%H:%M').to_f + 3600
  end

  def auth
    account_sid = '***********************'
    auth_token = '**********************'
  end

  def send_sms
    @message = @client.account.messages.create(
      from: '+441315104572',
      to: '0780*******',
      body: 'Thank you for your order. It will arrive at approx "#{time}"'
    )
  end
end
