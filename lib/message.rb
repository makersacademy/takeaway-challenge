require 'twilio-ruby'


class Message
  def initialize
    account_sid = 'AC4688a00aafdf8777e77f5eb69c3e7d63'
    auth_token = ''
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(sms)
      @client.account.messages.create({
      :from => '+441277424330',
      :to => '',
      :body => sms
    })
  end
  'sms'
end
