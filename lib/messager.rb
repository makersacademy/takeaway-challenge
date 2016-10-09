require 'rubygems'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class Messager

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send(message)
    @client.account.messages.create({ to: '+7783443580', from: '+441143032919', body: message})
  end

end
