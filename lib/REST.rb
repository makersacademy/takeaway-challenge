require 'twilio-ruby'

class SMS

  def send_sms(message)
    account_sid = ENV['SID']
    auth_token = ENV['AUTH']


    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
  from: '+441727263029',
  to: ENV['NUMBER'],
  body: message
)
  end
end
