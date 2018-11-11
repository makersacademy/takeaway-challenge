require 'twilio-ruby'

class SendSms

  def send(message)

    account_sid = '~'
    auth_token = '~'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
         body: "#{message}. It will be delivered before #{Time.now + 3600}!",
         from: 'xxx',
         to: 'xxx'
       )
  end

end
