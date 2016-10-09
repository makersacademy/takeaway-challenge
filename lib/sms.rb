require 'rubygems'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class SMS
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send(message)
    @client.account.messages.create({
      :to => '+447849539544',
      :from => '+441315101231',
      :body => message,
    })
  end
end
