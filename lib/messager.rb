require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class Messager

  attr_reader :message

  def initialize
    @credentials = Dotenv.load
    @account_sid = @credentials['ACCOUNT_SID']
    @auth_token = @credentials['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_sms(message)
    @client.messages.create(
    from: '+441704325073',
    to: '+447842112075',
    body: message
    )
    puts 'Your order has been confirmed'
  end

  def receive_sms
    message = @client.account.messages.get('SM614bbade097f4e189ff2375ec9793c2e')
    puts message.body
  end

end
