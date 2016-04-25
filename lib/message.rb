require 'twilio-ruby'
# require_relative 'takeaway'

class Message
  def initialize
    account_sid = 'AC4688a00aafdf8777e77f5eb69c3e7d63'
    auth_token = '9b407c62910d792864428f45187f5352'
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
