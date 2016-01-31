require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class Messager

  attr_reader :message

  def initialize
    @credentials = Dotenv.load
    @account_sid = @credentials['ACCOUNT_SID']
    @auth_token = @credentials['AUTH_TOKEN']
  end

  def send_sms(message)
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @client.messages.create(
    from: '+441704325073',
    to: '+447842112075',
    body: message
    )
  end



end
