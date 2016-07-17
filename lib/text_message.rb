require 'twilio-ruby'

class TextMessage

  def send_message(confirmation)

    account_sid = 'AC89d6c3870f2c469426d3bd7eb918733c'
    auth_token = '3837c876cb7753621861f88f96d6bfdd'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    from: '+44 1591 372048',
    to: '+44 7984 936483',
    body: confirmation
    )

  end

end
