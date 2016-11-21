require 'twilio-ruby'

class SMS

  def send_sms(message)
    # put your own credentials here
    account_sid = 'AC5cc5c163e24a7c11497035ecd5a7eadf'
    auth_token = '24e962b62822a6d0474a9bd96a1425d4'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
  from: '+441727263029',
  to: '+447492303735',
  body: message
)
  end
end
