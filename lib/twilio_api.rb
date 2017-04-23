require 'twilio-ruby'

class TwilioAPI

  def time
    Time.now + (60 * 60)
  end

  def send_sms
    account_sid = 'ACce25ebf0648b72b0fdb496dfca8fe940'
    auth_token = '31c69b5e19c5ca9649c7dc31da7700e4'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    from: '+441513290112',
    to: '+447446009876',
    body: "Thank you! Your order was placed and should be with you around #{time}"
    )
  end

end
