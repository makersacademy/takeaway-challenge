require 'twilio-ruby'

class Notifier

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token  = ENV['AUTH_TOKEN']
    @client     = Twilio::REST::Client.new account_sid, auth_token
  end
  

  def send_message(message_body)
  message = @client.account.messages.create(:body => "#{message_body}",
    :to => "+447474574540",    
    :from => "+441798422045")
  end

end
