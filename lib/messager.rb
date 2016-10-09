require 'rubygems'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class Messager

  def initialize
    account_sid = ENV['AC842c9dfef20893dd473b1c70e2f4130c']
    auth_token = ENV['5f5c38a7a38d8a7367ad97880c787243']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send(message)
    @client.account.messages.create({ to: '+7783443580', from: '+441143032919', body: message})
  end

end
