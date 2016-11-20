require 'rubygems'
require 'twilio-ruby'

class SendSMS

  account_sid = 'AC7be338ea330fcbf4b96ebff31884cbf7'
  auth_token = 'f7661c36cdf63b2eb157551fbcc18c26'
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => +441289466014,
    :to => +447771864895,
    :body => "Thank you for your order!"
  })

end
