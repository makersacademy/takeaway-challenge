require 'twilio-ruby'
require_relative 'hour'

class Sms

  def initialize
    account_sid = "AC6f140ad85801f0ff6f70294dbe5adeb0"
    auth_token  = "622956b94a663225ae9a15803f5881f8"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
    text = "Thank you! Your order was placed and will be delivered before #{Hour.new.eta_to_string}"
    message = @client.account.messages.create(:body => text,
        :to => "+447450634070",
        :from => "+441293311504")
    puts message.sid
  end

end
