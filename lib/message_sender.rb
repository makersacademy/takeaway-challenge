require_relative 'order.rb'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class MessageSender

  def initialize
    account_sid = ENV['account_sid']
    auth_token  = ENV['auth_token']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(to, message)
    @client.account.messages.create(
      from:  twilio_number,
      to:    to,
      body:  message,
      )
  end

  private

  def twilio_number
    twilio_number = ENV['twilio_number']
  end
end
