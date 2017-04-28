require 'twilio-ruby'

class TwilioAPI

  def time
    Time.now + (60 * 60)
  end

  def send_sms
    account_sid = 'ACXXX'
    auth_token = 'XXX'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    from: '+4415XXXXXXXX',
    to: '+44744XXXXXXX',
    body: "Thank you! Your order was placed and should be with you around #{time}"
    )
  end

end
