require 'twilio-ruby'

class SendSms

  def message_customer
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    from: '+441202286189',
    to: '+447429628198',
    body: 'Thank you! Your order was placed and will be delivered before 18:52'
    )
  end
end
