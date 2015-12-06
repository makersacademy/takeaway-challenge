require 'twilio-ruby'

class Sms

  def initialize
    @client = twilio_client
  end

  def send_sms(message)
    @client.messages.create(
     from: '+441424531106',
     to: '+447789515988',
     body: message
   )
  end

private

  def twilio_client
    account_sid = 'AC2fd2970ebdf2350d29c3cbdc54193118'
    auth_token = 'cd0c09d85f1ff303d96aaab5bb4176ac'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
