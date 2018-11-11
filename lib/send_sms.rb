require 'twilio-ruby'

class SendSms

  def send(message)

    account_sid = 'ACce313cdc20d9b638b5a565e06b67f8de'
    auth_token = 'aef68e0ab5c3d1825d494385a73adccf'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
         body: "#{message}. It will be delivered before #{Time.now + 3600}!",
         from: 'xxx',
         to: 'xxx'
       )
  end

end
