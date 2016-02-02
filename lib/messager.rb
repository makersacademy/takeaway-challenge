require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class Messager

  attr_reader :message

  def initialize
    Dotenv.load
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @my_number = ENV['MY_NUMBER']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_sms(message)
    @client.messages.create(
    from: @twilio_number,
    to: @my_number,
    body: message
    )
    'Your order has been confirmed'
  end

  def receive_sms
    message = @client.account.messages.get('SM614bbade097f4e189ff2375ec9793c2e')
    message.body
  end

end
