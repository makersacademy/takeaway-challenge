require_relative 'order.rb'
require 'twilio-ruby'

class MessageSender

  def initialize
    account_sid = 'ACca07befab205cff0cdc9e3e9d51d38be'
    auth_token  = '0d0bffe91cbe1e3da9aa2a506ed2771a'
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
    twilio_number = '+441287244036'
  end
end
